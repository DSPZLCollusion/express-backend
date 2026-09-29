import type { Request, Response } from 'express';

import db from '../db.js';

export async function getAllEvents(req: Request, res: Response): Promise<void> {
    try {
        const events = await db.any(`SELECT * FROM events`);
        res.status(200).json(events);
    } catch (err) {
        console.error('getAllEvents error:', err);
        res.status(500).json({ error: 'Failed to retrieve events' });
    }
}

export async function createEvent(req: Request, res: Response): Promise<void> {
    const { event_name, event_date } = req.body;

    if (!event_name) {
        res.status(400).json({ error: 'No name provided' });
        return;
    }
    if (!event_date) {
        res.status(400).json({ error: 'No date provided' });
        return;
    }

    try {
        const result = await db.one(`INSERT INTO events(event_name, event_date) VALUES($1, $2) RETURNING id`, [event_name, event_date]);
        res.status(201).json(result);
    } catch (error) {
        console.error('createEvent error:', error);
        res.status(500).json({ error: 'Failed to create event' });
    }
}