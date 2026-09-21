import { handleUpload, type HandleUploadBody } from '@vercel/blob/client';

// Keep these in sync with src/util/blob.ts.
const ALLOWED_CONTENT_TYPES = ['image/jpeg', 'image/png', 'image/webp'];
const MAX_BYTES = 4 * 1024 * 1024;
const PATH_PREFIX = 'pnm-photos/';

async function assertAuthorized(_request: Request): Promise<void> {
    // TODO: replace with your real auth check (session cookie, JWT, etc.).
    // This fails closed on purpose: without a check, anyone on the internet
    // could mint upload tokens for your Blob store.
    throw new Error('Upload route is not protected yet. Add your auth check here.');
}

export async function uploadPhoto(request: Request): Promise<Response> {
    const body = (await request.json()) as HandleUploadBody;

    try {
        const result = await handleUpload({
            body,
            request,
            onBeforeGenerateToken: async (pathname) => {
                await assertAuthorized(request);

                if (!pathname.startsWith(PATH_PREFIX)) {
                    throw new Error('Invalid upload path.');
                }

                // The browser can only upload what this token allows, so these
                // limits hold even if someone bypasses the checks in PhotoUpload.
                return {
                    allowedContentTypes: ALLOWED_CONTENT_TYPES,
                    maximumSizeInBytes: MAX_BYTES,
                    addRandomSuffix: true,
                };
            },
        });

        return Response.json(result);
    } catch (error) {
        return Response.json(
            { error: (error as Error).message },
            { status: 400 },
        );
    }
}