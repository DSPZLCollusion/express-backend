import { handleUpload, type HandleUploadBody } from '@vercel/blob/client';
import jwt from 'jsonwebtoken';

import type { Request, Response } from 'express';
import type { TokenPayload } from '../middleware/auth.js';

const ALLOWED_CONTENT_TYPES = ['image/jpeg', 'image/png', 'image/webp'];
const MAX_BYTES = 4 * 1024 * 1024;
const PATH_PREFIX = 'pnm-photos/';


export async function uploadPhoto(req: Request, res: Response): Promise<void> {
    const body = req.body as HandleUploadBody;

    try {
        const result = await handleUpload({
            body,
            request: req,
            onBeforeGenerateToken: async (pathname, clientPayload) => {
                // Verify the JWT forwarded via clientPayload (the upload() `headers`
                // option also reaches vercel.com and breaks CORS, so we use
                // clientPayload instead — it only travels to this endpoint).
                const secret = process.env.JWT_SECRET;
                if (!secret) throw new Error('Server configuration error.');

                if (!clientPayload) throw new Error('Unauthorized.');
                try {
                    jwt.verify(clientPayload, secret, { algorithms: ['HS256'] }) as TokenPayload;
                } catch {
                    throw new Error('Unauthorized.');
                }

                if (!pathname.startsWith(PATH_PREFIX)) {
                    throw new Error('Invalid upload path.');
                }

                return {
                    allowedContentTypes: ALLOWED_CONTENT_TYPES,
                    maximumSizeInBytes: MAX_BYTES,
                    addRandomSuffix: true,
                };
            },
        });

        res.status(200).json(result);
    } catch (error) {
        const message = (error as Error).message;
        // Surface auth and validation errors as 401/400 without leaking internals.
        if (message === 'Unauthorized.') {
            res.status(401).json({ error: 'Unauthorized.' });
        } else if (message === 'Invalid upload path.' || message === 'Server configuration error.') {
            res.status(400).json({ error: message });
        } else {
            res.status(400).json({ error: 'Upload failed.' });
        }
    }
}