import { handleUpload, type HandleUploadBody } from '@vercel/blob/client';
import jwt from 'jsonwebtoken';

import type { Request as ExpressRequest, Response } from 'express';
import type { TokenPayload } from '../middleware/auth.js';

const ALLOWED_CONTENT_TYPES = ['image/jpeg', 'image/png', 'image/webp'];
const MAX_BYTES = 4 * 1024 * 1024;
const PATH_PREFIX = 'pnm-photos/';

/**
 * handleUpload expects a standard Fetch API Request (it calls
 * request.headers.get(...) when verifying the signature on the automatic
 * 'blob.upload-completed' webhook callback). Express's req is not that —
 * req.headers is a plain object with no .get(), so passing req directly
 * throws a TypeError once Vercel calls back after an upload finishes.
 *
 * The webhook's signature is computed over the exact bytes Vercel sent, so
 * this must use the raw, unparsed body — re-serializing req.body with
 * JSON.stringify can change whitespace/key order/number formatting just
 * enough to make a valid signature look invalid. See routes/photo.ts for
 * the middleware change that captures req.rawBody.
 */
function toWebRequest(req: ExpressRequest): globalThis.Request {
    const headers = new Headers();
    for (const [key, value] of Object.entries(req.headers)) {
        if (value === undefined) continue;
        headers.set(key, Array.isArray(value) ? value.join(', ') : value);
    }

    const rawBody = (req as ExpressRequest & { rawBody?: Buffer }).rawBody;
    if (!rawBody) {
        // Falls back to a body-less request. Token generation (phase 1) still
        // works since it doesn't read the body, but webhook signature
        // verification (phase 2) will fail without the exact original bytes.
        console.warn(
            'photo upload: req.rawBody is missing — add the express.json() verify option ' +
            'described in routes/photo.ts, or webhook signature checks will fail.',
        );
    }

    const protocol = req.protocol;
    const host = req.get('host');
    const url = `${protocol}://${host}${req.originalUrl}`;

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
                // Verify the JWT forwarded via clientPayload (the upload() `headers`
                // option only reaches this endpoint, not the direct-to-Vercel PUT,
                // but clientPayload is the well-established pattern for this and
                // keeps the auth check independent of that detail).
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