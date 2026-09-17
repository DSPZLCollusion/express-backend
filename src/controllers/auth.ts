import type { Request, Response } from "express";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import db from '../db.js';
import type { AuthenticatedRequest } from "../middleware/auth.js";

interface UserRecord {
    user_id: string;
    username: string;
    email: string;
    password_hash: string;
    roles: string[];
}

async function hashPassword(pass: string): Promise<string> {
    const saltRounds = 10;
    const hashed = await bcrypt.hash(pass, saltRounds);
    return hashed;
}

async function verifyPassword(pass: string, storedHash: string): Promise<boolean> {
    return bcrypt.compare(pass, storedHash);
}

async function findUserByUsername(username: string): Promise<UserRecord | null> {
    return db.oneOrNone<UserRecord>(
        `SELECT
            u.user_id,
            u.username,
            u.email,
            u.password_hash,
            COALESCE(
                json_agg(ur.role_name) FILTER (WHERE ur.role_name IS NOT NULL),
                '[]'::json
            ) AS roles
         FROM users u
         LEFT JOIN user_roles ur ON u.user_id = ur.user_id
         WHERE u.username = $1
         GROUP BY u.user_id, u.username, u.email, u.password_hash`,
        [username]
    );
}

function generateToken(user: { userId: string; username: string; roles: string[] }): string {
    const secret = process.env.JWT_SECRET;
    if (!secret) {
        throw new Error("JWT_SECRET environment variable is not defined");
    }
    return jwt.sign(
        {
            userId: user.userId,
            username: user.username,
            roles: user.roles
        },
        secret,
        {
            expiresIn: "1h",
            algorithm: "HS256"
        }
    );
}

export async function login(req: Request, res: Response): Promise<void> {
    const { username, password } = req.body;
    if (!username || !password) {
        res.status(400).json({ error: "Username and password are required" });
        return;
    }
    try {
        const user = await findUserByUsername(username);
        if (!user) {
            res.status(401).json({ error: "Invalid username or password" });
            return;
        }
        const isValid = await verifyPassword(password, user.password_hash);
        if (!isValid) {
            res.status(401).json({ error: "Invalid username or password" });
            return;
        }
        const token = generateToken({
            userId: user.user_id,
            username: user.username,
            roles: user.roles
        });
        res.status(200).json({
            token,
            user: {
                userId: user.user_id,
                username: user.username,
                email: user.email,
                roles: user.roles
            }
        });
    } catch (error) {
        console.error('Login error:', error);
        res.status(500).json({ error: "Internal server error" });
    }
}

export function checkToken(req: AuthenticatedRequest, res: Response): void {
    res.status(200).json({ valid: true, user: req.user });
}

export async function register(req: Request, res: Response) {

}