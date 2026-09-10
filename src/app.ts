import express from 'express';
import bodyParser from 'body-parser';

import healthRoute from "./routes/health.js";
import pnmRoute from "./routes/pnm.js";

const app = express();

app.use(bodyParser.json());

app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    if (req.method === 'OPTIONS') {
        res.sendStatus(204);
        return;
    }
    next();
})

app.use(healthRoute);
app.use(pnmRoute);

app.listen(8080, '127.0.0.1');