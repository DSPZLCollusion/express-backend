import { handleUpload, type HandleUploadBody } from '@vercel/blob/client';

import type { Request as ExpressRequest, Response } from 'express';
import { verifyJwt } from '../middleware/auth.js';

const ALLOWED_CONTENT_TYPES = ['image/jpeg', 'image/png', 'image/webp'];
const MAX_BYTES = 4 * 1024 * 1024;
const PATH_PREFIX = 'pnm-photos/';

function toWebRequest(req: ExpressRequest): globalThis.Request {
    const headers = new Headers();
    for (const [key, value] of Object.entries(req.headers)) {
        if (value === undefined) continue;
        headers.set(key, Array.isArray(value) ? value.join(', ') : value);
    }

    const rawBody = (req as ExpressRequest & { rawBody?: Buffer }).rawBody;
    if (!rawBody) {
        console.warn(
            'photo upload: req.rawBody is missing — add the express.json() verify option ' +
            'described in routes/photo.ts, or webhook signature checks will fail.',
        );
    }

    const url = `${req.protocol}://${req.get('host')}${req.originalUrl}`;

    return new globalThis.Request(url, {
        method: req.method,
        headers,
        body: rawBody ?? null,
        ...(rawBody && { duplex: 'half' }),
    });
}

export async function uploadPhoto(req: ExpressRequest, res: Response): Promise<void> {
    if (!process.env.BLOB_READ_WRITE_TOKEN) {
        res.status(500).json({ error: 'Upload service not configured.' });
        return;
    }

    const body = req.body as HandleUploadBody;

    try {
        const result = await handleUpload({
            body,
            request: toWebRequest(req),
            onBeforeGenerateToken: async (pathname, clientPayload) => {
                if (!clientPayload) throw new Error('Unauthorized.');
                try {
                    verifyJwt(clientPayload);
                } catch {
                    throw new Error('Unauthorized.');
                }

                if (!pathname.startsWith(PATH_PREFIX)) {
                    throw new Error('Invalid upload path.');
                }

                return {
                    allowedContentTypes: ALLOWED_CONTENT_TYPES,
                    maximumSizeInBytes: MAX_BYTES,
                };
            },
        });

        res.status(200).json(result);
    } catch (error) {
        const message = (error as Error).message;
        if (message === 'Unauthorized.') {
            res.status(401).json({ error: 'Unauthorized.' });
        } else if (message === 'Invalid upload path.' || message === 'Server configuration error.') {
            res.status(400).json({ error: message });
        } else {
            res.status(400).json({ error: 'Upload failed.' });
        }
    }
}