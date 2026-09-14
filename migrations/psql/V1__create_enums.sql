CREATE TYPE class_year AS ENUM (
    'FRESHMAN',
    'SOPHOMORE',
    'JUNIOR',
    'SENIOR',
    'SUPER_SENIOR'
    );

CREATE TYPE status_type AS ENUM (
    'DELTA',
    'SIGMA',
    'PHI'
    );

CREATE TYPE housing_type AS ENUM (
    'ON_CAMPUS',
    'OFF_CAMPUS'
    );

CREATE TYPE action_type AS ENUM (
    'INFO_CHANGE',
    'STATUS_CHANGE',
    'COMMENT_ADDED',
    'COMMENT_EDITED',
    'COMMENT_DELETED',
    'ATTENDANCE_UPDATED',
    'INTEREST_ADDED',
    'INTEREST_REMOVED',
    'CONTACT_ADDED'
    );

CREATE TYPE dorm AS ENUM (
    'SPEED',
    'BSB',
    'BLUMBERG',
    'MEES',
    'DEMING',
    'SCHARPENBERG',
    'LAKESIDE',
    'PERCOPO',
    'APARTMENTS WEST',
    'APARTMENTS EAST',
    'TBA'
    );

CREATE TYPE role as ENUM (
    'USER',
    'DIC',
    'ADMIN'
);