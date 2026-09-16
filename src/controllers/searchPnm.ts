import type { Request, Response } from 'express';

import db from '../db.js';

type RequestParams = { pnmId: string };
type RequestBody = { text: string };

type SearchQuery = {
    first_name?: string;
    last_name?: string;
    email?: string;
    class_year?: string; // comma-separated ClassYear values
    status_type?: string; // comma-separated StatusType values
    dorm?: string; // comma-separated Dorm values
    interests?: string; // comma-separated interest names
    last_contacted?: string;
};

// Express parses a *repeated* query key (?class_year=A&class_year=B) as an
// array, even though our type claims `string`. Normalize defensively so a
// plain `.split(',')` never gets called on a non-string and throws.
function toStr(val: unknown): string {
    if (Array.isArray(val)) return val.join(',');
    return typeof val === 'string' ? val : '';
}

function toList(val: unknown): string[] {
    return toStr(val)
        .split(',')
        .map(s => s.trim())
        .filter(Boolean);
}

// Escape LIKE/ILIKE wildcard characters so user input like "50%" or "a_b"
// is matched literally instead of acting as a SQL wildcard.
function escapeLike(val: string): string {
    return val.replace(/[\\%_]/g, ch => `\\${ch}`);
}

type Builder = {
    conditions: string[];
    values: unknown[];
    push: (condition: string, value: unknown) => void;
};

function makeBuilder(): Builder {
    const conditions: string[] = [];
    const values: unknown[] = [];
    const push = (condition: string, value: unknown) => {
        values.push(value);
        conditions.push(condition.replace('?', `$${values.length}`));
    };
    return { conditions, values, push };
}

function addScalarFilters(b: Builder, q: SearchQuery) {
    const firstName = toStr(q.first_name);
    const lastName = toStr(q.last_name);
    const email = toStr(q.email).trim();

    if (firstName) b.push(`p.first_name ILIKE ? ESCAPE '\\'`, `%${escapeLike(firstName)}%`);
    if (lastName) b.push(`p.last_name ILIKE ? ESCAPE '\\'`, `%${escapeLike(lastName)}%`);
    if (email) b.push(`LOWER(p.email) = LOWER(?)`, email);
}

// Values *within* a single field are always OR'd together via ANY(...) —
// e.g. class_year=Freshman,Sophomore matches either one. That part was
// already correct and is unchanged/shared by both routes below.
const ENUM_CAST: Record<string, string> = {
    'p.class_year': 'class_year',
    'p.status_type': 'status_type',
    'p.dorm': 'dorm',
};

function addListFilter(b: Builder, column: string, raw: unknown) {
    const list = toList(raw);
    if (list.length === 0) return;
    const cast = ENUM_CAST[column] ?? 'text';
    if (list.length === 1) b.push(`${column} = ?::${cast}`, list[0]);
    else b.push(`${column} = ANY(?::${cast}[])`, list);
}

function addInterestsFilter(b: Builder, raw: unknown, mode: 'all' | 'any') {
    const list = toList(raw);
    if (list.length === 0) return;

    if (mode === 'all') {
        b.push(
            `p.id IN (
        SELECT pi.pnm_id FROM pnm_interests pi
        JOIN interests i ON i.id = pi.interest_id
        WHERE i.interest_name = ANY(?::text[])
        GROUP BY pi.pnm_id
        HAVING COUNT(DISTINCT i.interest_name) = ${list.length}
      )`,
            list
        );
    } else {
        b.push(
            `EXISTS (
        SELECT 1 FROM pnm_interests pi
        JOIN interests i ON i.id = pi.interest_id
        WHERE pi.pnm_id = p.id
          AND i.interest_name = ANY(?::text[])
      )`,
            list
        );
    }
}

function addLastContactedFilter(b: Builder, raw: unknown) {
    const list = toList(raw);
    if (list.length === 0) return;

    const parts: string[] = [];
    for (const label of list) {
        if (!(label in LAST_CONTACTED_MAP)) continue;
        const interval = LAST_CONTACTED_MAP[label];
        if (interval === null) {
            parts.push('p.last_contacted IS NULL');
        } else {
            b.values.push(interval);
            parts.push(`p.last_contacted >= NOW() - $${b.values.length}::interval`);
        }
    }
    if (parts.length) b.conditions.push(`(${parts.join(' OR ')})`);
}

const LAST_CONTACTED_MAP: Record<string, string | null> = {
    'NEVER': null,           // IS NULL
    'Last Day': '1 day',
    'Last Week': '7 days',
    'Last Month': '30 days',
};


async function runSearch(res: Response, b: Builder, join: 'AND' | 'OR') {
    const where = b.conditions.length ? `WHERE ${b.conditions.join(` ${join} `)}` : '';
    try {
        const pnms = await db.any(`SELECT * FROM pnm_details p ${where}`, b.values);
        res.status(200).json(pnms);
    } catch (err) {
        console.error('searchPnms error:', err);
        res.status(500).json({ error: 'Failed to search pnms' });
    }
}

/**
 * Every selected category must match (AND across fields).
 * Within a field, any one of the comma-separated values is enough (OR).
 * e.g. class_year=Freshman,Sophomore AND dorm=Smith
 *   -> (class_year = Freshman OR class_year = Sophomore) AND dorm = Smith
 */
export async function searchPnmsAnd(req: Request, res: Response): Promise<void> {
    const q = req.query as SearchQuery;
    const b = makeBuilder();

    addScalarFilters(b, q);
    addListFilter(b, 'p.class_year', q.class_year);
    addListFilter(b, 'p.status_type', q.status_type);
    addListFilter(b, 'p.dorm', q.dorm);
    addLastContactedFilter(b, q.last_contacted);
    addInterestsFilter(b, q.interests, 'all'); // must have ALL listed interests

    await runSearch(res, b, 'AND');
}

/**
 * Satisfying ANY one selected category is enough (OR across fields).
 * e.g. class_year=Freshman,Sophomore AND dorm=Smith
 *   -> (class_year = Freshman OR class_year = Sophomore) OR dorm = Smith
 */
export async function searchPnmsOr(req: Request, res: Response): Promise<void> {
    const q = req.query as SearchQuery;
    const b = makeBuilder();

    addScalarFilters(b, q);
    addListFilter(b, 'p.class_year', q.class_year);
    addListFilter(b, 'p.status_type', q.status_type);
    addListFilter(b, 'p.dorm', q.dorm);
    addLastContactedFilter(b, q.last_contacted);
    addInterestsFilter(b, q.interests, 'any'); // any ONE listed interest is enough

    await runSearch(res, b, 'OR');
}