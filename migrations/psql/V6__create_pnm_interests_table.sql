DROP TABLE IF EXISTS pnm_interests CASCADE;

CREATE TABLE pnm_interests (
    pnm_id      BIGINT NOT NULL REFERENCES pnms(id) ON DELETE CASCADE,
    interest_id BIGINT NOT NULL REFERENCES interests(id) ON DELETE CASCADE,
    PRIMARY KEY (pnm_id, interest_id)
);