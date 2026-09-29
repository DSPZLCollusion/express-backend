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
                    'id',           events.id,
                    'event_name',   events.event_name,
                    'event_date',   events.event_date,
                    'event_status', pnm_attendance.status
                ) ORDER BY events.event_date DESC
        ) AS events
    FROM pnm_attendance
    JOIN events ON pnm_attendance.event_id = events.id
    GROUP BY pnm_attendance.pnm_id
) AS pnm_events_agg ON pnms.id = pnm_events_agg.pnm_id;