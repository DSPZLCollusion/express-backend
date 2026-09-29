-- =============================================================================
-- V12__migrate.sql
-- Idempotent full-schema migration.
-- Wraps every prior step (V1–V11) with existence checks so this file can be
-- run against a blank database OR one that already has some objects in place.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- V1 – Enums
-- ---------------------------------------------------------------------------

DO $$ BEGIN
    CREATE TYPE class_year AS ENUM (
        'FRESHMAN', 'SOPHOMORE', 'JUNIOR', 'SENIOR', 'SUPER_SENIOR'
    );
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
    CREATE TYPE status_type AS ENUM (
        'DELTA', 'SIGMA', 'PHI'
    );
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
    CREATE TYPE housing_type AS ENUM (
        'ON_CAMPUS', 'OFF_CAMPUS'
    );
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
    CREATE TYPE action_type AS ENUM (
        'INFO_CHANGE', 'STATUS_CHANGE',
        'COMMENT_ADDED', 'COMMENT_EDITED', 'COMMENT_DELETED',
        'ATTENDANCE_UPDATED',
        'INTEREST_ADDED', 'INTEREST_REMOVED',
        'CONTACT_ADDED'
    );
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
    CREATE TYPE dorm AS ENUM (
        'SPEED', 'BSB', 'BLUMBERG', 'MEES', 'DEMING',
        'SCHARPENBERG', 'LAKESIDE', 'PERCOPO',
        'APARTMENTS WEST', 'APARTMENTS EAST', 'TBA'
    );
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
    CREATE TYPE role AS ENUM (
        'USER', 'DIC', 'ADMIN'
    );
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
    CREATE TYPE attendance_status AS ENUM (
        'ATTENDED', 'RSVPD', 'NO_SHOW'
    );
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

-- ---------------------------------------------------------------------------
-- V2 – pnms
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS pnms (
    id             BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name     VARCHAR(50)   NOT NULL,
    last_name      VARCHAR(50)   NOT NULL,
    class_year     class_year    NOT NULL,
    status_type    status_type,
    email          VARCHAR(254)  NOT NULL UNIQUE,
    phone_number   VARCHAR(20)   NOT NULL,
    photo_url      VARCHAR(2048),
    created_at     TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    last_contacted TIMESTAMPTZ
);

-- ---------------------------------------------------------------------------
-- V3 – off_campus_housing
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS off_campus_housing (
    pnm_id         BIGINT       PRIMARY KEY REFERENCES pnms,
    street_address VARCHAR(255) NOT NULL,
    city           VARCHAR(100) NOT NULL,
    state          VARCHAR(50)  NOT NULL,
    zip_code       VARCHAR(20)  NOT NULL
);

-- ---------------------------------------------------------------------------
-- V4 – on_campus_housing
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS on_campus_housing (
    pnm_id      BIGINT      PRIMARY KEY REFERENCES pnms,
    dorm        dorm        NOT NULL,
    room_number VARCHAR(20) NOT NULL
);

-- ---------------------------------------------------------------------------
-- V5 – interests
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS interests (
    id            BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    interest_name VARCHAR(100) NOT NULL UNIQUE
);

-- ---------------------------------------------------------------------------
-- V6 – pnm_interests (junction)
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS pnm_interests (
    pnm_id      BIGINT NOT NULL REFERENCES pnms(id)      ON DELETE CASCADE,
    interest_id BIGINT NOT NULL REFERENCES interests(id) ON DELETE CASCADE,
    PRIMARY KEY (pnm_id, interest_id)
);

-- ---------------------------------------------------------------------------
-- V7 – pnm_details view
-- ---------------------------------------------------------------------------


CREATE VIEW pnm_details AS
SELECT
    pnms.id,
    pnms.first_name,
    pnms.last_name,
    pnms.class_year,
    pnms.status_type,
    pnms.email,
    pnms.phone_number,
    pnms.photo_url,
    pnms.created_at,
    pnms.last_contacted,
    on_campus_housing.dorm,
    on_campus_housing.room_number,
    off_campus_housing.street_address,
    off_campus_housing.city,
    off_campus_housing.state,
    off_campus_housing.zip_code,
    coalesce(pnm_interests_agg.interests, '{}')  AS interests,
    coalesce(pnm_events_agg.events,       '[]') AS events
FROM pnms
LEFT JOIN on_campus_housing  ON pnms.id = on_campus_housing.pnm_id
LEFT JOIN off_campus_housing ON pnms.id = off_campus_housing.pnm_id
LEFT JOIN (
    SELECT
        pnm_interests.pnm_id,
        array_agg(interests.interest_name) AS interests
    FROM pnm_interests
    JOIN interests ON pnm_interests.interest_id = interests.id
    GROUP BY pnm_interests.pnm_id
) AS pnm_interests_agg ON pnms.id = pnm_interests_agg.pnm_id
LEFT JOIN (
    SELECT
        pnm_attendance.pnm_id,
        json_agg(
            json_build_object(
                'event_id',   events.id,
                'event_name', events.event_name,
                'event_date', events.event_date,
                'status',     pnm_attendance.status
            ) ORDER BY events.event_date DESC
        ) AS events
    FROM pnm_attendance
    JOIN events ON pnm_attendance.event_id = events.id
    GROUP BY pnm_attendance.pnm_id
) AS pnm_events_agg ON pnms.id = pnm_events_agg.pnm_id;
-- ---------------------------------------------------------------------------
-- V8 – users
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS users (
    user_id       BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username      VARCHAR(255) NOT NULL UNIQUE,
    email         VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);

-- ---------------------------------------------------------------------------
-- V9 – user_roles (junction)
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS user_roles (
    user_id     BIGINT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    role_name   role   NOT NULL DEFAULT 'USER',
    PRIMARY KEY (user_id, role_name)
);

CREATE INDEX IF NOT EXISTS idx_user_roles_user_id ON user_roles(user_id);

-- ---------------------------------------------------------------------------
-- V11 – events
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS events (
    id         BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    event_name       VARCHAR(100) NOT NULL,
    event_date TIMESTAMPTZ  NOT NULL,
    created_at TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- ---------------------------------------------------------------------------
-- V12 – pnm_attendance (junction)
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS pnm_attendance (
    pnm_id      BIGINT             NOT NULL REFERENCES pnms(id)   ON DELETE CASCADE,
    event_id    BIGINT             NOT NULL REFERENCES events(id)  ON DELETE CASCADE,
    status      attendance_status  NOT NULL DEFAULT 'ATTENDED',
    recorded_at TIMESTAMPTZ        NOT NULL DEFAULT NOW(),
    PRIMARY KEY (pnm_id, event_id)
);

CREATE INDEX IF NOT EXISTS idx_pnm_attendance_pnm_id   ON pnm_attendance(pnm_id);
CREATE INDEX IF NOT EXISTS idx_pnm_attendance_event_id ON pnm_attendance(event_id);
