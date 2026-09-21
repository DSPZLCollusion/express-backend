import { handleUpload, type HandleUploadBody } from '@vercel/blob/client';

import type { Request, Response } from 'express';


// Keep these in sync with src/util/blob.ts.
const ALLOWED_CONTENT_TYPES = ['image/jpeg', 'image/png', 'image/webp'];
const MAX_BYTES = 4 * 1024 * 1024;
const PATH_PREFIX = 'pnm-photos/';


export async function uploadPhoto(req: Request, res: Response): Promise<void> {
    const body = req.body as HandleUploadBody;

    try {
        const result = await handleUpload({
            body,
            request: req,
            onBeforeGenerateToken: async (pathname) => {

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
        res.status(400).json(
            { error: (error as Error).message },
        );
    }
}