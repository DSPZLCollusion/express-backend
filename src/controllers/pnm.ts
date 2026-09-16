import type { Request, Response, NextFunction } from 'express';
import type { CreatePnmBody, CreatePnm, OnCampusHousing, OffCampusHousing } from '../models/pnm.js';
import { parseSql } from '../models/pnm.js';

import db from '../db.js';

type RequestParams = { pnmId: string };
type RequestBody = { text: string };

export async function getAllPnms(req: Request, res: Response): Promise<void> {
    try {
        const pnms = await db.any(`SELECT * FROM pnm_details`);
        res.status(200).json(pnms);
    } catch (err) {
        console.error('getAllPnms error:', err);
        res.status(500).json({ error: 'Failed to retrieve pnms' });
    }
}

export async function getPnm(req: Request, res: Response): Promise<void> {
    const param = req.params as RequestParams;
    const pnmId = param.pnmId;
    try {
        const pnm = await db.oneOrNone(`SELECT * FROM pnm_details WHERE id = $1`, [pnmId]);
        if (!pnm) {
            res.status(404).json({ error: 'PNM not found' });
            return;
        }
        res.status(200).json(parseSql(pnm));
    } catch (err) {
        console.error('getPnm error:', err);
        res.status(500).json({ error: 'Failed to retrieve pnm' });
    }
}

export async function createPnm(req: Request, res: Response): Promise<void> {
    const body = req.body as CreatePnmBody;
    const info: CreatePnm = body.info;
    const off_campus: OffCampusHousing | null = body.off_campus;
    const on_campus: OnCampusHousing | null = body.on_campus;
    const interests: string[] | null = body.interests;

    if (!info.first_name || !info.last_name || !info.email) {
        res.status(400).json({ error: 'first_name, last_name, and email are required' });
        return;
    }

    if (!off_campus && !on_campus) {
        res.status(400).json({ error: 'housing type needs to be defined.' });
        return;
    }

    try {
        const result = await db.tx(async t => {
            // 1. Insert core PNM record
            const newPnm = await t.one(
                `INSERT INTO pnms (first_name, last_name, class_year, status_type, email, phone_number, photo_url)
                 VALUES ($1, $2, $3, $4, $5, $6, $7)
                 RETURNING id`,
                [
                    info.first_name,
                    info.last_name,
                    info.class_year,
                    info.status_type ?? null,
                    info.email,
                    info.phone_number,
                    info.photo_url ?? null
                ]
            );
            const pnmId: number = newPnm.id;

            // 2. Insert on-campus housing if provided
            if (on_campus) {
                await t.none(
                    `INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
                     VALUES ($1, $2, $3)`,
                    [pnmId, on_campus.dorm, on_campus.room_number]
                );
            }

            // 3. Insert off-campus housing if provided
            if (off_campus) {
                await t.none(
                    `INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
                     VALUES ($1, $2, $3, $4, $5)`,
                    [pnmId, off_campus.street_address, off_campus.city, off_campus.state, off_campus.zip_code]
                );
            }

            // 4. Insert interests if provided
            if (interests && interests.length > 0) {
                for (const name of interests) {
                    // Upsert the interest name, then link it to this PNM
                    const { id: interestId } = await t.one(
                        `INSERT INTO interests (interest_name)
                         VALUES ($1)
                         ON CONFLICT (interest_name) DO UPDATE SET interest_name = EXCLUDED.interest_name
                         RETURNING id`,
                        [name]
                    );
                    await t.none(
                        `INSERT INTO pnm_interests (pnm_id, interest_id)
                         VALUES ($1, $2)
                         ON CONFLICT DO NOTHING`,
                        [pnmId, interestId]
                    );
                }
            }

            return newPnm;
        });

        res.status(201).json(result);
    } catch (err) {
        console.error('createPnm error:', err);
        res.status(500).json({ error: 'Failed to create pnm' });
    }
}

export async function updatePnm(req: Request, res: Response): Promise<void> {
    const param = req.params as RequestParams;
    const pnmId = param.pnmId;
    const body = req.body as CreatePnmBody;
    const info: CreatePnm = body.info;
    const off_campus: OffCampusHousing | null = body.off_campus;
    const on_campus: OnCampusHousing | null = body.on_campus;
    const interests: string[] | null = body.interests;

    if (!info.first_name || !info.last_name || !info.email) {
        res.status(400).json({ error: 'first_name, last_name, and email are required' });
        return;
    }

    if (!off_campus && !on_campus) {
        res.status(400).json({ error: 'housing type needs to be defined.' });
        return;
    }

    try {
        const result = await db.tx(async t => {
            // 1. Update core PNM record
            const updated = await t.oneOrNone(
                `UPDATE pnms
                 SET first_name = $1, last_name = $2, class_year = $3, status_type = $4,
                     email = $5, phone_number = $6, photo_url = $7
                 WHERE id = $8
                 RETURNING id`,
                [
                    info.first_name,
                    info.last_name,
                    info.class_year,
                    info.status_type ?? null,
                    info.email,
                    info.phone_number,
                    info.photo_url ?? null,
                    pnmId
                ]
            );

            if (!updated) return null;

            // 2. Replace on-campus housing
            await t.none('DELETE FROM on_campus_housing WHERE pnm_id = $1', [pnmId]);
            if (on_campus) {
                await t.none(
                    `INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
                     VALUES ($1, $2, $3)`,
                    [pnmId, on_campus.dorm, on_campus.room_number]
                );
            }

            // 3. Replace off-campus housing
            await t.none('DELETE FROM off_campus_housing WHERE pnm_id = $1', [pnmId]);
            if (off_campus) {
                await t.none(
                    `INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
                     VALUES ($1, $2, $3, $4, $5)`,
                    [pnmId, off_campus.street_address, off_campus.city, off_campus.state, off_campus.zip_code]
                );
            }

            // 4. Replace interests
            await t.none('DELETE FROM pnm_interests WHERE pnm_id = $1', [pnmId]);
            if (interests && interests.length > 0) {
                for (const name of interests) {
                    const { id: interestId } = await t.one(
                        `INSERT INTO interests (interest_name)
                         VALUES ($1)
                         ON CONFLICT (interest_name) DO UPDATE SET interest_name = EXCLUDED.interest_name
                         RETURNING id`,
                        [name]
                    );
                    await t.none(
                        `INSERT INTO pnm_interests (pnm_id, interest_id)
                         VALUES ($1, $2)
                         ON CONFLICT DO NOTHING`,
                        [pnmId, interestId]
                    );
                }
            }

            return updated;
        });

        if (!result) {
            res.status(404).json({ error: 'PNM not found' });
            return;
        }
        res.status(200).json(result);
    } catch (err) {
        console.error('updatePnm error:', err);
        res.status(500).json({ error: 'Failed to update pnm' });
    }
}

export async function deletePnm(req: Request, res: Response): Promise<void> {
    const param = req.params as RequestParams;
    const pnmId = param.pnmId;
    try {
        const deleted = await db.tx(async t => {
            await t.none('DELETE FROM pnm_interests      WHERE pnm_id = $1', [pnmId]);
            await t.none('DELETE FROM on_campus_housing  WHERE pnm_id = $1', [pnmId]);
            await t.none('DELETE FROM off_campus_housing WHERE pnm_id = $1', [pnmId]);

            return t.oneOrNone('DELETE FROM pnms WHERE id = $1 RETURNING id', [pnmId]);
        });
        if (!deleted) {
            res.status(404).json({ error: 'PNM not found' });
            return;
        }
        res.status(200).json(deleted);
    } catch (err) {
        console.error('getPnm error:', err);
        res.status(500).json({ error: 'Failed to retrieve pnm' });
    }
}

export async function updatePnmContacted(req: Request, res: Response): Promise<void> {
    const param = req.params as RequestParams;
    const pnmId = param.pnmId;
    try {
        const updated = await db.oneOrNone(`
            UPDATE pnms
            SET last_contacted = NOW()
            WHERE id = $1
            RETURNING id, last_contacted
            `, [pnmId]);
        if (!updated) {
            res.status(404).json({ error: 'PNM not found' });
            return;
        }
        res.status(200).json(updated);
    } catch (err) {
        console.error('getPnm error:', err);
        res.status(500).json({ error: 'Failed to retrieve pnm' });
    }
}
