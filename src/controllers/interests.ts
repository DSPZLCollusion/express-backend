import type { Request, Response, NextFunction } from 'express';

import db from '../db.js';

export async function getAllInterests(req: Request, res: Response): Promise<void> {
    try {
        const interests = await db.any(`SELECT DISTINCT interest_name FROM interests`);
        res.status(200).json(interests);
    } catch (err) {
        console.error('getAllInterests error:', err);
        res.status(500).json({ error: 'Failed to retrieve interests' });
    }
}

