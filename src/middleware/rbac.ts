import type { Response, Request, NextFunction } from 'express';
import type { AuthenticatedRequest } from './auth.js';

export function verifyRole(allowedRoles: string[]) {
    return (req: AuthenticatedRequest, res: Response, next: NextFunction): void => {
        const userRoles = req.user?.roles;

        if (!userRoles || userRoles.length === 0) {
            res.status(403).json({ message: "No roles assigned" });
            return;
        }

        const hasRole = userRoles.some(role => allowedRoles.includes(role));

        if (!hasRole) {
            res.status(403).json({ message: 'Insufficient permissions' });
            return;
        }

        next();
    }
}