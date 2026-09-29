CREATE TABLE pnm_attendance (
    pnm_id     BIGINT NOT NULL REFERENCES pnms(id)   ON DELETE CASCADE,
    event_id   BIGINT NOT NULL REFERENCES events(id) ON DELETE CASCADE,
    status     attendance_status NOT NULL DEFAULT 'ATTENDED',
    recorded_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (pnm_id, event_id)
);