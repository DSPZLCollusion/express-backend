DROP VIEW IF EXISTS pnm_details;

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
    pnms.last_contacted,
    on_campus_housing.dorm,
    on_campus_housing.room_number,
    off_campus_housing.street_address,
    off_campus_housing.city,
    off_campus_housing.state,
    off_campus_housing.zip_code,
    array_agg(interests.interest_name)
        FILTER (WHERE interests.interest_name IS NOT NULL) AS interests
FROM pnms
LEFT JOIN on_campus_housing  ON pnms.id = on_campus_housing.pnm_id
LEFT JOIN off_campus_housing ON pnms.id = off_campus_housing.pnm_id
LEFT JOIN pnm_interests      ON pnms.id = pnm_interests.pnm_id
LEFT JOIN interests          ON pnm_interests.interest_id = interests.id
GROUP BY
    pnms.id,
    pnms.email,
    pnms.phone_number,
    pnms.photo_url,
    on_campus_housing.dorm,
    on_campus_housing.room_number,
    off_campus_housing.street_address,
    off_campus_housing.city,
    off_campus_housing.state,
    off_campus_housing.zip_code;
