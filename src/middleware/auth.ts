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

export function verifyToken(req: AuthenticatedRequest, res: Response, next: NextFunction): void {
    const authHeader = req.headers["authorization"];
    if (!authHeader) {
        res.status(401).json({ message: 'No token provided' });
        return;
    }

    const secret = process.env.JWT_SECRET;
    if (!secret) {
        res.status(500).json({ message: 'Internal server error' });
        return;
    }
    const token = authHeader.split(' ')[1];
    if (!token) {
        res.status(401).json({ message: 'No token provided' });
        return;
    }
    try {
        const decoded = jwt.verify(token, secret, { algorithms: ["HS256"] }) as unknown as TokenPayload;
        req.user = decoded;
        next();
    } catch (error) {
        res.status(401).json({ message: 'Invalid or expired token' });
    }
}

