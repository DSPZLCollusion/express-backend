import pgPromise from 'pg-promise';
import dotenv from 'dotenv';

// dotenv.config({ path: `.env.${process.env.NODE_ENV}` })

dotenv.config();

const pgp = pgPromise();

const db = pgp({
    host: process.env.POSTGRES_HOST as string,
    port: Number(process.env.POSTGRES_PORT) as number,
    database: process.env.POSTGRES_DB as string,
    user: process.env.POSTGRES_USER as string,
    password: process.env.POSTGRES_PASSWORD as string
});

export default db;
