import express from 'express';
import bodyParser from 'body-parser';

import healthRoute from "./routes/health.js";
import pnmRoute from "./routes/pnm.js";
import authRoute from "./routes/auth.js";
import { verifyToken } from './middleware/auth.js';
import photoRoute from "./routes/photo.js";

const app = express();

app.use(bodyParser.json());

const allowedOrigins = [
    'https://dspzlcollusion.vercel.app',
    'http://localhost:3000',
    'http://localhost:5173',
    'http://localhost:8080'
];

app.use((req, res, next) => {
    const origin = req.headers.origin;
    if (origin && (allowedOrigins.includes(origin) || /^http:\/\/localhost:\d+$/.test(origin) || /^http:\/\/127\.0\.0\.1:\d+$/.test(origin))) {
        res.setHeader('Access-Control-Allow-Origin', origin);
    } else {
        res.setHeader('Access-Control-Allow-Origin', 'https://dspzlcollusion.vercel.app');
    }
    res.setHeader('Access-Control-Allow-Methods', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    if (req.method === 'OPTIONS') {
        res.sendStatus(204);
        return;
    }
    next();
})

app.use(authRoute);
app.use(healthRoute);
app.use(photoRoute);
app.use(verifyToken, pnmRoute);


app.listen(8080, '127.0.0.1');

export default app;

