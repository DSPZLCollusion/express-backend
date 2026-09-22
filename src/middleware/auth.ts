import type { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

export interface TokenPayload {
    userId: string;
    username: string;
    roles: string[];
}

export interface AuthenticatedRequest extends Request {
    user?: TokenPayload;
}

/**
 * Verifies a raw JWT string and returns the decoded payload.
 * Throws an error if the secret is missing or the token is invalid.
 */
export function verifyJwt(token: string): TokenPayload {
    const secret = process.env.JWT_SECRET;
    if (!secret) throw new Error('Server configuration error.');
    return jwt.verify(token, secret, { algorithms: ['HS256'] }) as unknown as TokenPayload;
}

export function verifyToken(req: AuthenticatedRequest, res: Response, next: NextFunction): void {
    const authHeader = req.headers["authorization"];
    if (!authHeader) {
        res.status(401).json({ message: 'No token provided' });
        return;
    }

    const token = authHeader.split(' ')[1];
    if (!token) {
        res.status(401).json({ message: 'No token provided' });
        return;
    }
    try {
        req.user = verifyJwt(token);
        next();
    } catch {
        res.status(401).json({ message: 'Invalid or expired token' });
    }
}

