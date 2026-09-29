-- =============================================================================
-- seed.sql
-- Sample data for local development and testing.
-- Safe to re-run: existing rows are skipped via ON CONFLICT DO NOTHING.
-- Run AFTER V12__migrate.sql has been applied.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- Interests
-- ---------------------------------------------------------------------------

INSERT INTO interests (interest_name) VALUES
    ('Engineering'),
    ('Music'),
    ('Gaming'),
    ('Basketball'),
    ('Soccer'),
    ('Film'),
    ('Cooking'),
    ('Photography'),
    ('Hiking'),
    ('Finance'),
    ('Reading'),
    ('Fitness'),
    ('Art'),
    ('Chess'),
    ('Volunteering')
ON CONFLICT (interest_name) DO NOTHING;

-- ---------------------------------------------------------------------------
-- PNMs (75 records)
-- ---------------------------------------------------------------------------

INSERT INTO pnms (first_name, last_name, class_year, status_type, email, phone_number, created_at) VALUES
    ('James',     'Carter',     'FRESHMAN',     'DELTA', 'james.carter@uni.edu',      '555-101-0001', NOW() - INTERVAL '74 minutes'),
    ('Maria',     'Lopez',      'SOPHOMORE',    'SIGMA', 'maria.lopez@uni.edu',       '555-101-0002', NOW() - INTERVAL '73 minutes'),
    ('Tyler',     'Brooks',     'JUNIOR',       'PHI',   'tyler.brooks@uni.edu',      '555-101-0003', NOW() - INTERVAL '72 minutes'),
    ('Aisha',     'Patel',      'SENIOR',       'DELTA', 'aisha.patel@uni.edu',       '555-101-0004', NOW() - INTERVAL '71 minutes'),
    ('Connor',    'Wu',         'SUPER_SENIOR', 'SIGMA', 'connor.wu@uni.edu',         '555-101-0005', NOW() - INTERVAL '70 minutes'),
    ('Sophia',    'Nguyen',     'FRESHMAN',     NULL,    'sophia.nguyen@uni.edu',     '555-101-0006', NOW() - INTERVAL '69 minutes'),
    ('Marcus',    'Johnson',    'SOPHOMORE',    'PHI',   'marcus.johnson@uni.edu',    '555-101-0007', NOW() - INTERVAL '68 minutes'),
    ('Elena',     'Rivera',     'JUNIOR',       'DELTA', 'elena.rivera@uni.edu',      '555-101-0008', NOW() - INTERVAL '67 minutes'),
    ('Noah',      'Kim',        'SENIOR',       NULL,    'noah.kim@uni.edu',          '555-101-0009', NOW() - INTERVAL '66 minutes'),
    ('Priya',     'Sharma',     'FRESHMAN',     'SIGMA', 'priya.sharma@uni.edu',      '555-101-0010', NOW() - INTERVAL '65 minutes'),
    ('Liam',      'Anderson',   'SOPHOMORE',    'DELTA', 'liam.anderson@uni.edu',     '555-101-0011', NOW() - INTERVAL '64 minutes'),
    ('Zoe',       'Martinez',   'JUNIOR',       NULL,    'zoe.martinez@uni.edu',      '555-101-0012', NOW() - INTERVAL '63 minutes'),
    ('Ethan',     'Thompson',   'SENIOR',       'PHI',   'ethan.thompson@uni.edu',    '555-101-0013', NOW() - INTERVAL '62 minutes'),
    ('Ava',       'White',      'FRESHMAN',     'SIGMA', 'ava.white@uni.edu',         '555-101-0014', NOW() - INTERVAL '61 minutes'),
    ('Jackson',   'Harris',     'SOPHOMORE',    NULL,    'jackson.harris@uni.edu',    '555-101-0015', NOW() - INTERVAL '60 minutes'),
    ('Isabella',  'Clark',      'JUNIOR',       'DELTA', 'isabella.clark@uni.edu',   '555-101-0016', NOW() - INTERVAL '59 minutes'),
    ('Lucas',     'Lewis',      'SUPER_SENIOR', 'PHI',   'lucas.lewis@uni.edu',       '555-101-0017', NOW() - INTERVAL '58 minutes'),
    ('Mia',       'Robinson',   'FRESHMAN',     NULL,    'mia.robinson@uni.edu',      '555-101-0018', NOW() - INTERVAL '57 minutes'),
    ('Aiden',     'Walker',     'SOPHOMORE',    'SIGMA', 'aiden.walker@uni.edu',      '555-101-0019', NOW() - INTERVAL '56 minutes'),
    ('Harper',    'Hall',       'JUNIOR',       'DELTA', 'harper.hall@uni.edu',       '555-101-0020', NOW() - INTERVAL '55 minutes'),
    ('Elijah',    'Allen',      'SENIOR',       'PHI',   'elijah.allen@uni.edu',      '555-101-0021', NOW() - INTERVAL '54 minutes'),
    ('Camila',    'Young',      'FRESHMAN',     NULL,    'camila.young@uni.edu',      '555-101-0022', NOW() - INTERVAL '53 minutes'),
    ('Grayson',   'Hernandez',  'SOPHOMORE',    'DELTA', 'grayson.hernandez@uni.edu', '555-101-0023', NOW() - INTERVAL '52 minutes'),
    ('Scarlett',  'King',       'JUNIOR',       'SIGMA', 'scarlett.king@uni.edu',     '555-101-0024', NOW() - INTERVAL '51 minutes'),
    ('Oliver',    'Wright',     'SENIOR',       NULL,    'oliver.wright@uni.edu',     '555-101-0025', NOW() - INTERVAL '50 minutes'),
    ('Luna',      'Scott',      'SUPER_SENIOR', 'PHI',   'luna.scott@uni.edu',        '555-101-0026', NOW() - INTERVAL '49 minutes'),
    ('Mason',     'Torres',     'FRESHMAN',     'DELTA', 'mason.torres@uni.edu',      '555-101-0027', NOW() - INTERVAL '48 minutes'),
    ('Penelope',  'Nguyen',     'SOPHOMORE',    'SIGMA', 'penelope.nguyen@uni.edu',   '555-101-0028', NOW() - INTERVAL '47 minutes'),
    ('Sebastian', 'Green',      'JUNIOR',       NULL,    'sebastian.green@uni.edu',   '555-101-0029', NOW() - INTERVAL '46 minutes'),
    ('Violet',    'Adams',      'SENIOR',       'DELTA', 'violet.adams@uni.edu',      '555-101-0030', NOW() - INTERVAL '45 minutes'),
    ('Caleb',     'Baker',      'FRESHMAN',     'PHI',   'caleb.baker@uni.edu',       '555-101-0031', NOW() - INTERVAL '44 minutes'),
    ('Nora',      'Gonzalez',   'SOPHOMORE',    NULL,    'nora.gonzalez@uni.edu',     '555-101-0032', NOW() - INTERVAL '43 minutes'),
    ('Eli',       'Nelson',     'JUNIOR',       'SIGMA', 'eli.nelson@uni.edu',        '555-101-0033', NOW() - INTERVAL '42 minutes'),
    ('Aubrey',    'Carter',     'SENIOR',       'DELTA', 'aubrey.carter@uni.edu',     '555-101-0034', NOW() - INTERVAL '41 minutes'),
    ('Wyatt',     'Mitchell',   'SUPER_SENIOR', NULL,    'wyatt.mitchell@uni.edu',    '555-101-0035', NOW() - INTERVAL '40 minutes'),
    ('Stella',    'Perez',      'FRESHMAN',     'PHI',   'stella.perez@uni.edu',      '555-101-0036', NOW() - INTERVAL '39 minutes'),
    ('Hunter',    'Roberts',    'SOPHOMORE',    'SIGMA', 'hunter.roberts@uni.edu',    '555-101-0037', NOW() - INTERVAL '38 minutes'),
    ('Layla',     'Turner',     'JUNIOR',       NULL,    'layla.turner@uni.edu',      '555-101-0038', NOW() - INTERVAL '37 minutes'),
    ('Declan',    'Phillips',   'SENIOR',       'DELTA', 'declan.phillips@uni.edu',   '555-101-0039', NOW() - INTERVAL '36 minutes'),
    ('Naomi',     'Campbell',   'FRESHMAN',     'PHI',   'naomi.campbell@uni.edu',    '555-101-0040', NOW() - INTERVAL '35 minutes'),
    ('Bryson',    'Parker',     'SOPHOMORE',    NULL,    'bryson.parker@uni.edu',     '555-101-0041', NOW() - INTERVAL '34 minutes'),
    ('Isla',      'Evans',      'JUNIOR',       'SIGMA', 'isla.evans@uni.edu',        '555-101-0042', NOW() - INTERVAL '33 minutes'),
    ('Jaxon',     'Edwards',    'SENIOR',       'DELTA', 'jaxon.edwards@uni.edu',     '555-101-0043', NOW() - INTERVAL '32 minutes'),
    ('Piper',     'Collins',    'SUPER_SENIOR', NULL,    'piper.collins@uni.edu',     '555-101-0044', NOW() - INTERVAL '31 minutes'),
    ('Everett',   'Stewart',    'FRESHMAN',     'PHI',   'everett.stewart@uni.edu',   '555-101-0045', NOW() - INTERVAL '30 minutes'),
    ('Aurora',    'Sanchez',    'SOPHOMORE',    'SIGMA', 'aurora.sanchez@uni.edu',    '555-101-0046', NOW() - INTERVAL '29 minutes'),
    ('Reid',      'Morris',     'JUNIOR',       NULL,    'reid.morris@uni.edu',       '555-101-0047', NOW() - INTERVAL '28 minutes'),
    ('Chloe',     'Rogers',     'SENIOR',       'DELTA', 'chloe.rogers@uni.edu',      '555-101-0048', NOW() - INTERVAL '27 minutes'),
    ('Finn',      'Reed',       'FRESHMAN',     'PHI',   'finn.reed@uni.edu',         '555-101-0049', NOW() - INTERVAL '26 minutes'),
    ('Savannah',  'Cook',       'SOPHOMORE',    NULL,    'savannah.cook@uni.edu',     '555-101-0050', NOW() - INTERVAL '25 minutes'),
    ('Dominic',   'Morgan',     'JUNIOR',       'SIGMA', 'dominic.morgan@uni.edu',    '555-101-0051', NOW() - INTERVAL '24 minutes'),
    ('Lydia',     'Bell',       'SENIOR',       'DELTA', 'lydia.bell@uni.edu',        '555-101-0052', NOW() - INTERVAL '23 minutes'),
    ('Asher',     'Murphy',     'SUPER_SENIOR', NULL,    'asher.murphy@uni.edu',      '555-101-0053', NOW() - INTERVAL '22 minutes'),
    ('Hazel',     'Bailey',     'FRESHMAN',     'PHI',   'hazel.bailey@uni.edu',      '555-101-0054', NOW() - INTERVAL '21 minutes'),
    ('Silas',     'Rivera',     'SOPHOMORE',    'SIGMA', 'silas.rivera@uni.edu',      '555-101-0055', NOW() - INTERVAL '20 minutes'),
    ('Willow',    'Cooper',     'JUNIOR',       NULL,    'willow.cooper@uni.edu',     '555-101-0056', NOW() - INTERVAL '19 minutes'),
    ('Emmett',    'Richardson', 'SENIOR',       'DELTA', 'emmett.richardson@uni.edu', '555-101-0057', NOW() - INTERVAL '18 minutes'),
    ('Brielle',   'Cox',        'FRESHMAN',     'PHI',   'brielle.cox@uni.edu',       '555-101-0058', NOW() - INTERVAL '17 minutes'),
    ('Rowan',     'Howard',     'SOPHOMORE',    NULL,    'rowan.howard@uni.edu',      '555-101-0059', NOW() - INTERVAL '16 minutes'),
    ('Adeline',   'Ward',       'JUNIOR',       'SIGMA', 'adeline.ward@uni.edu',      '555-101-0060', NOW() - INTERVAL '15 minutes'),
    ('Theo',      'Torres',     'SENIOR',       'DELTA', 'theo.torres@uni.edu',       '555-101-0061', NOW() - INTERVAL '14 minutes'),
    ('Paisley',   'Peterson',   'SUPER_SENIOR', NULL,    'paisley.peterson@uni.edu',  '555-101-0062', NOW() - INTERVAL '13 minutes'),
    ('Knox',      'Gray',       'FRESHMAN',     'PHI',   'knox.gray@uni.edu',         '555-101-0063', NOW() - INTERVAL '12 minutes'),
    ('Genevieve', 'Ramirez',    'SOPHOMORE',    'SIGMA', 'genevieve.ramirez@uni.edu', '555-101-0064', NOW() - INTERVAL '11 minutes'),
    ('Beckett',   'James',      'JUNIOR',       NULL,    'beckett.james@uni.edu',     '555-101-0065', NOW() - INTERVAL '10 minutes'),
    ('Seraphina', 'Watson',     'SENIOR',       'DELTA', 'seraphina.watson@uni.edu',  '555-101-0066', NOW() - INTERVAL '9 minutes'),
    ('Miles',     'Brooks',     'FRESHMAN',     'PHI',   'miles.brooks@uni.edu',      '555-101-0067', NOW() - INTERVAL '8 minutes'),
    ('Celeste',   'Kelly',      'SOPHOMORE',    NULL,    'celeste.kelly@uni.edu',     '555-101-0068', NOW() - INTERVAL '7 minutes'),
    ('Griffin',   'Sanders',    'JUNIOR',       'SIGMA', 'griffin.sanders@uni.edu',   '555-101-0069', NOW() - INTERVAL '6 minutes'),
    ('Arabella',  'Price',      'SENIOR',       'DELTA', 'arabella.price@uni.edu',    '555-101-0070', NOW() - INTERVAL '5 minutes'),
    ('Zane',      'Bennett',    'SUPER_SENIOR', NULL,    'zane.bennett@uni.edu',      '555-101-0071', NOW() - INTERVAL '4 minutes'),
    ('Freya',     'Wood',       'FRESHMAN',     'PHI',   'freya.wood@uni.edu',        '555-101-0072', NOW() - INTERVAL '3 minutes'),
    ('Caden',     'Barnes',     'SOPHOMORE',    'SIGMA', 'caden.barnes@uni.edu',      '555-101-0073', NOW() - INTERVAL '2 minutes'),
    ('Ophelia',   'Ross',       'JUNIOR',       NULL,    'ophelia.ross@uni.edu',      '555-101-0074', NOW() - INTERVAL '1 minute'),
    ('Dawson',    'Henderson',  'SENIOR',       'DELTA', 'dawson.henderson@uni.edu',  '555-101-0075', NOW())
ON CONFLICT (email) DO NOTHING;

-- ---------------------------------------------------------------------------
-- On-campus housing (45 PNMs)
-- ---------------------------------------------------------------------------

INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'SPEED',           '101' FROM pnms WHERE email = 'james.carter@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'BSB',             '204' FROM pnms WHERE email = 'maria.lopez@uni.edu'        ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'BLUMBERG',        '312' FROM pnms WHERE email = 'tyler.brooks@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'LAKESIDE',        '405' FROM pnms WHERE email = 'sophia.nguyen@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'MEES',            '118' FROM pnms WHERE email = 'marcus.johnson@uni.edu'     ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'APARTMENTS EAST', '2B'  FROM pnms WHERE email = 'priya.sharma@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'DEMING',          '210' FROM pnms WHERE email = 'liam.anderson@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'PERCOPO',         '307' FROM pnms WHERE email = 'zoe.martinez@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'SCHARPENBERG',    '115' FROM pnms WHERE email = 'ava.white@uni.edu'          ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'BSB',             '401' FROM pnms WHERE email = 'jackson.harris@uni.edu'     ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'SPEED',           '222' FROM pnms WHERE email = 'mia.robinson@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'LAKESIDE',        '318' FROM pnms WHERE email = 'aiden.walker@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'BLUMBERG',        '110' FROM pnms WHERE email = 'camila.young@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'MEES',            '205' FROM pnms WHERE email = 'grayson.hernandez@uni.edu'  ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'APARTMENTS WEST', '4A'  FROM pnms WHERE email = 'mason.torres@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'DEMING',          '319' FROM pnms WHERE email = 'penelope.nguyen@uni.edu'    ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'PERCOPO',         '208' FROM pnms WHERE email = 'sebastian.green@uni.edu'    ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'TBA',             'TBA' FROM pnms WHERE email = 'violet.adams@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'SPEED',           '303' FROM pnms WHERE email = 'caleb.baker@uni.edu'        ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'BSB',             '112' FROM pnms WHERE email = 'nora.gonzalez@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'SCHARPENBERG',    '220' FROM pnms WHERE email = 'eli.nelson@uni.edu'         ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'LAKESIDE',        '416' FROM pnms WHERE email = 'stella.perez@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'BLUMBERG',        '209' FROM pnms WHERE email = 'hunter.roberts@uni.edu'     ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'MEES',            '317' FROM pnms WHERE email = 'naomi.campbell@uni.edu'     ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'DEMING',          '104' FROM pnms WHERE email = 'bryson.parker@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'PERCOPO',         '412' FROM pnms WHERE email = 'isla.evans@uni.edu'         ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'APARTMENTS EAST', '3C'  FROM pnms WHERE email = 'everett.stewart@uni.edu'   ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'SPEED',           '118' FROM pnms WHERE email = 'aurora.sanchez@uni.edu'     ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'BSB',             '306' FROM pnms WHERE email = 'finn.reed@uni.edu'          ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'SCHARPENBERG',    '411' FROM pnms WHERE email = 'savannah.cook@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'LAKESIDE',        '201' FROM pnms WHERE email = 'hazel.bailey@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'BLUMBERG',        '315' FROM pnms WHERE email = 'silas.rivera@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'MEES',            '109' FROM pnms WHERE email = 'willow.cooper@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'DEMING',          '214' FROM pnms WHERE email = 'brielle.cox@uni.edu'        ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'PERCOPO',         '308' FROM pnms WHERE email = 'rowan.howard@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'APARTMENTS WEST', '1D'  FROM pnms WHERE email = 'adeline.ward@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'SPEED',           '417' FROM pnms WHERE email = 'knox.gray@uni.edu'          ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'BSB',             '213' FROM pnms WHERE email = 'genevieve.ramirez@uni.edu'  ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'SCHARPENBERG',    '320' FROM pnms WHERE email = 'miles.brooks@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'LAKESIDE',        '107' FROM pnms WHERE email = 'celeste.kelly@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'BLUMBERG',        '418' FROM pnms WHERE email = 'freya.wood@uni.edu'         ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'MEES',            '216' FROM pnms WHERE email = 'caden.barnes@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'DEMING',          '122' FROM pnms WHERE email = 'ophelia.ross@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'PERCOPO',         '305' FROM pnms WHERE email = 'dawson.henderson@uni.edu'   ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'APARTMENTS EAST', '5A'  FROM pnms WHERE email = 'griffin.sanders@uni.edu'   ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO on_campus_housing (pnm_id, dorm, room_number)
SELECT id, 'TBA',             'TBA' FROM pnms WHERE email = 'beckett.james@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;

-- ---------------------------------------------------------------------------
-- Off-campus housing (30 PNMs)
-- ---------------------------------------------------------------------------

INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '742 Evergreen Terrace',   'Springfield',  'IL', '62701' FROM pnms WHERE email = 'aisha.patel@uni.edu'        ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '1600 Maple Ave Apt 3',    'Shelbyville',  'IL', '62565' FROM pnms WHERE email = 'connor.wu@uni.edu'          ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '221 Baker Street',        'Capital City', 'IL', '62701' FROM pnms WHERE email = 'elena.rivera@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '55 Water Street Apt 9C',  'Springfield',  'IL', '62704' FROM pnms WHERE email = 'noah.kim@uni.edu'           ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '300 Riverside Dr',        'Shelbyville',  'IL', '62565' FROM pnms WHERE email = 'ethan.thompson@uni.edu'     ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '88 Pine Street Apt 5',    'Springfield',  'IL', '62702' FROM pnms WHERE email = 'isabella.clark@uni.edu'     ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '15 Oak Lane',             'Capital City', 'IL', '62703' FROM pnms WHERE email = 'lucas.lewis@uni.edu'        ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '490 Cherry Blvd',         'Springfield',  'IL', '62701' FROM pnms WHERE email = 'harper.hall@uni.edu'        ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '77 Elm Court',            'Shelbyville',  'IL', '62565' FROM pnms WHERE email = 'elijah.allen@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '1010 Willow Way Apt 2',   'Springfield',  'IL', '62704' FROM pnms WHERE email = 'scarlett.king@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '630 Birch Road',          'Capital City', 'IL', '62703' FROM pnms WHERE email = 'oliver.wright@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '200 Sunset Drive Apt 7B', 'Shelbyville',  'IL', '62565' FROM pnms WHERE email = 'luna.scott@uni.edu'         ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '44 Redwood Ave',          'Springfield',  'IL', '62702' FROM pnms WHERE email = 'aubrey.carter@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '910 Hillcrest Blvd',      'Capital City', 'IL', '62703' FROM pnms WHERE email = 'wyatt.mitchell@uni.edu'     ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '33 Magnolia Court',       'Shelbyville',  'IL', '62565' FROM pnms WHERE email = 'layla.turner@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '501 Crescent Drive',      'Springfield',  'IL', '62701' FROM pnms WHERE email = 'declan.phillips@uni.edu'    ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '12 Foxglove Lane',        'Capital City', 'IL', '62703' FROM pnms WHERE email = 'jaxon.edwards@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '78 Sycamore Street',      'Shelbyville',  'IL', '62565' FROM pnms WHERE email = 'piper.collins@uni.edu'      ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '350 Clover Field Rd',     'Springfield',  'IL', '62704' FROM pnms WHERE email = 'reid.morris@uni.edu'        ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '20 Jasmine Way',          'Capital City', 'IL', '62701' FROM pnms WHERE email = 'chloe.rogers@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '88 Larkspur Ave Apt 1',   'Springfield',  'IL', '62702' FROM pnms WHERE email = 'dominic.morgan@uni.edu'     ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '415 Walnut Grove Dr',     'Shelbyville',  'IL', '62565' FROM pnms WHERE email = 'lydia.bell@uni.edu'         ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '600 Harbor View Rd',      'Capital City', 'IL', '62703' FROM pnms WHERE email = 'asher.murphy@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '29 Carnation Circle',     'Springfield',  'IL', '62701' FROM pnms WHERE email = 'emmett.richardson@uni.edu'  ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '111 Daisy Lane Apt 6',    'Shelbyville',  'IL', '62565' FROM pnms WHERE email = 'theo.torres@uni.edu'        ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '820 Fern Valley Rd',      'Springfield',  'IL', '62704' FROM pnms WHERE email = 'paisley.peterson@uni.edu'   ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '47 Meadowlark Dr',        'Capital City', 'IL', '62703' FROM pnms WHERE email = 'seraphina.watson@uni.edu'   ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '303 Ashwood Court',       'Shelbyville',  'IL', '62565' FROM pnms WHERE email = 'arabella.price@uni.edu'     ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '99 Timber Trail',         'Springfield',  'IL', '62702' FROM pnms WHERE email = 'zane.bennett@uni.edu'       ON CONFLICT (pnm_id) DO NOTHING;
INSERT INTO off_campus_housing (pnm_id, street_address, city, state, zip_code)
SELECT id, '512 Bluebell Path',       'Capital City', 'IL', '62701' FROM pnms WHERE email = 'dawson.henderson@uni.edu'   ON CONFLICT (pnm_id) DO NOTHING;

-- ---------------------------------------------------------------------------
-- PNM interests
-- ---------------------------------------------------------------------------

INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'james.carter@uni.edu'       AND i.interest_name IN ('Engineering', 'Gaming')              ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'maria.lopez@uni.edu'        AND i.interest_name IN ('Music', 'Photography')               ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'tyler.brooks@uni.edu'       AND i.interest_name IN ('Basketball', 'Film')                 ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'aisha.patel@uni.edu'        AND i.interest_name IN ('Finance', 'Cooking')                 ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'connor.wu@uni.edu'          AND i.interest_name IN ('Soccer', 'Gaming', 'Film')           ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'sophia.nguyen@uni.edu'      AND i.interest_name IN ('Hiking', 'Photography')              ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'marcus.johnson@uni.edu'     AND i.interest_name IN ('Basketball', 'Engineering')          ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'elena.rivera@uni.edu'       AND i.interest_name IN ('Music', 'Cooking', 'Hiking')         ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'noah.kim@uni.edu'           AND i.interest_name IN ('Finance', 'Soccer')                  ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'priya.sharma@uni.edu'       AND i.interest_name IN ('Engineering', 'Film', 'Gaming')      ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'liam.anderson@uni.edu'      AND i.interest_name IN ('Chess', 'Finance')                   ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'zoe.martinez@uni.edu'       AND i.interest_name IN ('Art', 'Music')                       ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'ethan.thompson@uni.edu'     AND i.interest_name IN ('Fitness', 'Basketball')              ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'ava.white@uni.edu'          AND i.interest_name IN ('Reading', 'Film')                    ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'jackson.harris@uni.edu'     AND i.interest_name IN ('Soccer', 'Gaming')                   ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'isabella.clark@uni.edu'     AND i.interest_name IN ('Volunteering', 'Cooking')            ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'lucas.lewis@uni.edu'        AND i.interest_name IN ('Engineering', 'Chess')               ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'mia.robinson@uni.edu'       AND i.interest_name IN ('Art', 'Photography')                 ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'aiden.walker@uni.edu'       AND i.interest_name IN ('Fitness', 'Soccer')                  ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'harper.hall@uni.edu'        AND i.interest_name IN ('Music', 'Reading')                   ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'elijah.allen@uni.edu'       AND i.interest_name IN ('Basketball', 'Finance')              ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'camila.young@uni.edu'       AND i.interest_name IN ('Hiking', 'Volunteering')             ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'grayson.hernandez@uni.edu'  AND i.interest_name IN ('Gaming', 'Film')                     ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'scarlett.king@uni.edu'      AND i.interest_name IN ('Photography', 'Art')                 ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'oliver.wright@uni.edu'      AND i.interest_name IN ('Chess', 'Engineering')               ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'luna.scott@uni.edu'         AND i.interest_name IN ('Cooking', 'Fitness')                 ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'mason.torres@uni.edu'       AND i.interest_name IN ('Soccer', 'Basketball')               ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'penelope.nguyen@uni.edu'    AND i.interest_name IN ('Reading', 'Music', 'Art')            ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'sebastian.green@uni.edu'    AND i.interest_name IN ('Hiking', 'Gaming')                   ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'violet.adams@uni.edu'       AND i.interest_name IN ('Volunteering', 'Finance')            ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'caleb.baker@uni.edu'        AND i.interest_name IN ('Engineering', 'Basketball')          ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'nora.gonzalez@uni.edu'      AND i.interest_name IN ('Reading', 'Cooking')                 ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'eli.nelson@uni.edu'         AND i.interest_name IN ('Chess', 'Gaming')                    ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'aubrey.carter@uni.edu'      AND i.interest_name IN ('Finance', 'Photography')             ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'wyatt.mitchell@uni.edu'     AND i.interest_name IN ('Hiking', 'Fitness')                  ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'stella.perez@uni.edu'       AND i.interest_name IN ('Art', 'Volunteering')                ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'hunter.roberts@uni.edu'     AND i.interest_name IN ('Soccer', 'Film')                     ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'layla.turner@uni.edu'       AND i.interest_name IN ('Music', 'Reading')                   ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'declan.phillips@uni.edu'    AND i.interest_name IN ('Basketball', 'Engineering')          ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'naomi.campbell@uni.edu'     AND i.interest_name IN ('Photography', 'Cooking')             ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'bryson.parker@uni.edu'      AND i.interest_name IN ('Gaming', 'Fitness')                  ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'isla.evans@uni.edu'         AND i.interest_name IN ('Art', 'Film')                        ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'jaxon.edwards@uni.edu'      AND i.interest_name IN ('Soccer', 'Chess')                    ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'piper.collins@uni.edu'      AND i.interest_name IN ('Finance', 'Volunteering')            ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'everett.stewart@uni.edu'    AND i.interest_name IN ('Engineering', 'Hiking')              ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'aurora.sanchez@uni.edu'     AND i.interest_name IN ('Music', 'Art')                       ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'reid.morris@uni.edu'        AND i.interest_name IN ('Basketball', 'Reading')              ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'chloe.rogers@uni.edu'       AND i.interest_name IN ('Photography', 'Film')                ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'finn.reed@uni.edu'          AND i.interest_name IN ('Gaming', 'Soccer')                   ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'savannah.cook@uni.edu'      AND i.interest_name IN ('Cooking', 'Volunteering')            ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'dominic.morgan@uni.edu'     AND i.interest_name IN ('Finance', 'Chess')                   ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'lydia.bell@uni.edu'         AND i.interest_name IN ('Art', 'Music')                       ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'asher.murphy@uni.edu'       AND i.interest_name IN ('Hiking', 'Basketball')               ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'hazel.bailey@uni.edu'       AND i.interest_name IN ('Reading', 'Photography')             ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'silas.rivera@uni.edu'       AND i.interest_name IN ('Engineering', 'Fitness')             ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'willow.cooper@uni.edu'      AND i.interest_name IN ('Film', 'Art')                        ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'emmett.richardson@uni.edu'  AND i.interest_name IN ('Soccer', 'Gaming')                   ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'brielle.cox@uni.edu'        AND i.interest_name IN ('Volunteering', 'Music')              ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'rowan.howard@uni.edu'       AND i.interest_name IN ('Chess', 'Finance')                   ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'adeline.ward@uni.edu'       AND i.interest_name IN ('Cooking', 'Photography')             ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'theo.torres@uni.edu'        AND i.interest_name IN ('Basketball', 'Hiking')               ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'paisley.peterson@uni.edu'   AND i.interest_name IN ('Reading', 'Film')                    ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'knox.gray@uni.edu'          AND i.interest_name IN ('Gaming', 'Engineering')              ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'genevieve.ramirez@uni.edu'  AND i.interest_name IN ('Art', 'Volunteering')                ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'beckett.james@uni.edu'      AND i.interest_name IN ('Soccer', 'Fitness')                  ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'seraphina.watson@uni.edu'   AND i.interest_name IN ('Music', 'Chess')                     ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'miles.brooks@uni.edu'       AND i.interest_name IN ('Basketball', 'Film')                 ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'celeste.kelly@uni.edu'      AND i.interest_name IN ('Cooking', 'Reading')                 ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'griffin.sanders@uni.edu'    AND i.interest_name IN ('Engineering', 'Soccer')              ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'arabella.price@uni.edu'     AND i.interest_name IN ('Photography', 'Art')                 ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'zane.bennett@uni.edu'       AND i.interest_name IN ('Hiking', 'Finance')                  ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'freya.wood@uni.edu'         AND i.interest_name IN ('Music', 'Volunteering')              ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'caden.barnes@uni.edu'       AND i.interest_name IN ('Gaming', 'Chess')                    ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'ophelia.ross@uni.edu'       AND i.interest_name IN ('Film', 'Reading')                    ON CONFLICT DO NOTHING;
INSERT INTO pnm_interests (pnm_id, interest_id)
SELECT p.id, i.id FROM pnms p, interests i
WHERE p.email = 'dawson.henderson@uni.edu'   AND i.interest_name IN ('Basketball', 'Fitness')              ON CONFLICT DO NOTHING;

-- ---------------------------------------------------------------------------
-- Events
-- ---------------------------------------------------------------------------

INSERT INTO events (event_name, event_date) VALUES
    ('Rush Kickoff Night', '2025-09-05 18:00:00+00'),
    ('House Tour & BBQ',   '2025-09-08 17:00:00+00'),
    ('Sports Night',       '2025-09-11 19:00:00+00'),
    ('Formal Dinner',      '2025-09-15 18:30:00+00'),
    ('Service Day',        '2025-09-18 09:00:00+00'),
    ('Game Night',         '2025-09-20 20:00:00+00'),
    ('Bid Night',          '2025-09-25 19:00:00+00')
ON CONFLICT DO NOTHING;

-- ---------------------------------------------------------------------------
-- PNM attendance
-- ---------------------------------------------------------------------------

-- Rush Kickoff Night – 50 attended, 14 RSVP'd, 11 no-show
INSERT INTO pnm_attendance (pnm_id, event_id, status)
SELECT p.id, e.id, 'ATTENDED'
FROM pnms p, events e
WHERE e.event_name = 'Rush Kickoff Night'
  AND p.email IN (
    'james.carter@uni.edu',   'maria.lopez@uni.edu',    'tyler.brooks@uni.edu',
    'aisha.patel@uni.edu',    'connor.wu@uni.edu',      'sophia.nguyen@uni.edu',
    'marcus.johnson@uni.edu', 'elena.rivera@uni.edu',   'noah.kim@uni.edu',
    'priya.sharma@uni.edu',   'liam.anderson@uni.edu',  'zoe.martinez@uni.edu',
    'ethan.thompson@uni.edu', 'ava.white@uni.edu',      'jackson.harris@uni.edu',
    'isabella.clark@uni.edu', 'lucas.lewis@uni.edu',    'mia.robinson@uni.edu',
    'aiden.walker@uni.edu',   'harper.hall@uni.edu',    'elijah.allen@uni.edu',
    'camila.young@uni.edu',   'grayson.hernandez@uni.edu','scarlett.king@uni.edu',
    'oliver.wright@uni.edu',  'luna.scott@uni.edu',     'mason.torres@uni.edu',
    'penelope.nguyen@uni.edu','sebastian.green@uni.edu','violet.adams@uni.edu',
    'caleb.baker@uni.edu',    'nora.gonzalez@uni.edu',  'eli.nelson@uni.edu',
    'aubrey.carter@uni.edu',  'stella.perez@uni.edu',   'hunter.roberts@uni.edu',
    'naomi.campbell@uni.edu', 'bryson.parker@uni.edu',  'isla.evans@uni.edu',
    'everett.stewart@uni.edu','aurora.sanchez@uni.edu', 'finn.reed@uni.edu',
    'savannah.cook@uni.edu',  'hazel.bailey@uni.edu',   'silas.rivera@uni.edu',
    'brielle.cox@uni.edu',    'adeline.ward@uni.edu',   'knox.gray@uni.edu',
    'miles.brooks@uni.edu',   'dawson.henderson@uni.edu'
  )
ON CONFLICT DO NOTHING;

INSERT INTO pnm_attendance (pnm_id, event_id, status)
SELECT p.id, e.id, 'RSVPD'
FROM pnms p, events e
WHERE e.event_name = 'Rush Kickoff Night'
  AND p.email IN (
    'wyatt.mitchell@uni.edu', 'layla.turner@uni.edu',   'declan.phillips@uni.edu',
    'jaxon.edwards@uni.edu',  'piper.collins@uni.edu',  'reid.morris@uni.edu',
    'chloe.rogers@uni.edu',   'dominic.morgan@uni.edu', 'lydia.bell@uni.edu',
    'emmett.richardson@uni.edu','rowan.howard@uni.edu', 'theo.torres@uni.edu',
    'genevieve.ramirez@uni.edu','griffin.sanders@uni.edu'
  )
ON CONFLICT DO NOTHING;

INSERT INTO pnm_attendance (pnm_id, event_id, status)
SELECT p.id, e.id, 'NO_SHOW'
FROM pnms p, events e
WHERE e.event_name = 'Rush Kickoff Night'
  AND p.email IN (
    'asher.murphy@uni.edu',   'willow.cooper@uni.edu',  'beckett.james@uni.edu',
    'seraphina.watson@uni.edu','celeste.kelly@uni.edu', 'arabella.price@uni.edu',
    'zane.bennett@uni.edu',   'freya.wood@uni.edu',     'caden.barnes@uni.edu',
    'ophelia.ross@uni.edu',   'paisley.peterson@uni.edu'
  )
ON CONFLICT DO NOTHING;

-- House Tour & BBQ – 45 attended, 10 no-show, 20 not recorded
INSERT INTO pnm_attendance (pnm_id, event_id, status)
SELECT p.id, e.id, 'ATTENDED'
FROM pnms p, events e
WHERE e.event_name = 'House Tour & BBQ'
  AND p.email IN (
    'james.carter@uni.edu',   'maria.lopez@uni.edu',    'tyler.brooks@uni.edu',
    'aisha.patel@uni.edu',    'sophia.nguyen@uni.edu',  'marcus.johnson@uni.edu',
    'elena.rivera@uni.edu',   'priya.sharma@uni.edu',   'liam.anderson@uni.edu',
    'ethan.thompson@uni.edu', 'ava.white@uni.edu',      'isabella.clark@uni.edu',
    'mia.robinson@uni.edu',   'aiden.walker@uni.edu',   'elijah.allen@uni.edu',
    'grayson.hernandez@uni.edu','mason.torres@uni.edu', 'violet.adams@uni.edu',
    'caleb.baker@uni.edu',    'nora.gonzalez@uni.edu',  'eli.nelson@uni.edu',
    'aubrey.carter@uni.edu',  'stella.perez@uni.edu',   'hunter.roberts@uni.edu',
    'naomi.campbell@uni.edu', 'bryson.parker@uni.edu',  'isla.evans@uni.edu',
    'everett.stewart@uni.edu','aurora.sanchez@uni.edu', 'finn.reed@uni.edu',
    'savannah.cook@uni.edu',  'hazel.bailey@uni.edu',   'silas.rivera@uni.edu',
    'brielle.cox@uni.edu',    'adeline.ward@uni.edu',   'knox.gray@uni.edu',
    'miles.brooks@uni.edu',   'genevieve.ramirez@uni.edu','beckett.james@uni.edu',
    'celeste.kelly@uni.edu',  'griffin.sanders@uni.edu','freya.wood@uni.edu',
    'caden.barnes@uni.edu',   'ophelia.ross@uni.edu',   'dawson.henderson@uni.edu'
  )
ON CONFLICT DO NOTHING;

INSERT INTO pnm_attendance (pnm_id, event_id, status)
SELECT p.id, e.id, 'NO_SHOW'
FROM pnms p, events e
WHERE e.event_name = 'House Tour & BBQ'
  AND p.email IN (
    'connor.wu@uni.edu',       'noah.kim@uni.edu',       'zoe.martinez@uni.edu',
    'scarlett.king@uni.edu',   'wyatt.mitchell@uni.edu', 'layla.turner@uni.edu',
    'jaxon.edwards@uni.edu',   'asher.murphy@uni.edu',   'arabella.price@uni.edu',
    'paisley.peterson@uni.edu'
  )
ON CONFLICT DO NOTHING;

-- Sports Night – 38 attended
INSERT INTO pnm_attendance (pnm_id, event_id, status)
SELECT p.id, e.id, 'ATTENDED'
FROM pnms p, events e
WHERE e.event_name = 'Sports Night'
  AND p.email IN (
    'james.carter@uni.edu',   'tyler.brooks@uni.edu',   'connor.wu@uni.edu',
    'marcus.johnson@uni.edu', 'noah.kim@uni.edu',       'liam.anderson@uni.edu',
    'ethan.thompson@uni.edu', 'jackson.harris@uni.edu', 'lucas.lewis@uni.edu',
    'aiden.walker@uni.edu',   'elijah.allen@uni.edu',   'grayson.hernandez@uni.edu',
    'mason.torres@uni.edu',   'sebastian.green@uni.edu','oliver.wright@uni.edu',
    'caleb.baker@uni.edu',    'eli.nelson@uni.edu',     'hunter.roberts@uni.edu',
    'declan.phillips@uni.edu','bryson.parker@uni.edu',  'jaxon.edwards@uni.edu',
    'finn.reed@uni.edu',      'dominic.morgan@uni.edu', 'asher.murphy@uni.edu',
    'silas.rivera@uni.edu',   'emmett.richardson@uni.edu','rowan.howard@uni.edu',
    'theo.torres@uni.edu',    'knox.gray@uni.edu',      'beckett.james@uni.edu',
    'miles.brooks@uni.edu',   'griffin.sanders@uni.edu','zane.bennett@uni.edu',
    'caden.barnes@uni.edu',   'dawson.henderson@uni.edu','wyatt.mitchell@uni.edu',
    'reid.morris@uni.edu',    'everett.stewart@uni.edu'
  )
ON CONFLICT DO NOTHING;

-- Formal Dinner – 30 attended, 8 RSVP'd
INSERT INTO pnm_attendance (pnm_id, event_id, status)
SELECT p.id, e.id, 'ATTENDED'
FROM pnms p, events e
WHERE e.event_name = 'Formal Dinner'
  AND p.email IN (
    'aisha.patel@uni.edu',    'maria.lopez@uni.edu',    'elena.rivera@uni.edu',
    'priya.sharma@uni.edu',   'ava.white@uni.edu',      'isabella.clark@uni.edu',
    'harper.hall@uni.edu',    'scarlett.king@uni.edu',  'penelope.nguyen@uni.edu',
    'violet.adams@uni.edu',   'zoe.martinez@uni.edu',   'camila.young@uni.edu',
    'nora.gonzalez@uni.edu',  'aubrey.carter@uni.edu',  'layla.turner@uni.edu',
    'naomi.campbell@uni.edu', 'isla.evans@uni.edu',     'piper.collins@uni.edu',
    'aurora.sanchez@uni.edu', 'chloe.rogers@uni.edu',   'savannah.cook@uni.edu',
    'lydia.bell@uni.edu',     'hazel.bailey@uni.edu',   'willow.cooper@uni.edu',
    'brielle.cox@uni.edu',    'adeline.ward@uni.edu',   'genevieve.ramirez@uni.edu',
    'seraphina.watson@uni.edu','celeste.kelly@uni.edu', 'arabella.price@uni.edu'
  )
ON CONFLICT DO NOTHING;

INSERT INTO pnm_attendance (pnm_id, event_id, status)
SELECT p.id, e.id, 'RSVPD'
FROM pnms p, events e
WHERE e.event_name = 'Formal Dinner'
  AND p.email IN (
    'sophia.nguyen@uni.edu',  'mia.robinson@uni.edu',   'luna.scott@uni.edu',
    'stella.perez@uni.edu',   'everett.stewart@uni.edu','freya.wood@uni.edu',
    'ophelia.ross@uni.edu',   'paisley.peterson@uni.edu'
  )
ON CONFLICT DO NOTHING;

-- Service Day – 25 attended
INSERT INTO pnm_attendance (pnm_id, event_id, status)
SELECT p.id, e.id, 'ATTENDED'
FROM pnms p, events e
WHERE e.event_name = 'Service Day'
  AND p.email IN (
    'sophia.nguyen@uni.edu',  'elena.rivera@uni.edu',   'isabella.clark@uni.edu',
    'camila.young@uni.edu',   'violet.adams@uni.edu',   'penelope.nguyen@uni.edu',
    'mia.robinson@uni.edu',   'harper.hall@uni.edu',    'zoe.martinez@uni.edu',
    'luna.scott@uni.edu',     'nora.gonzalez@uni.edu',  'layla.turner@uni.edu',
    'naomi.campbell@uni.edu', 'piper.collins@uni.edu',  'savannah.cook@uni.edu',
    'willow.cooper@uni.edu',  'brielle.cox@uni.edu',    'adeline.ward@uni.edu',
    'genevieve.ramirez@uni.edu','celeste.kelly@uni.edu','freya.wood@uni.edu',
    'arabella.price@uni.edu', 'ophelia.ross@uni.edu',   'stella.perez@uni.edu',
    'aurora.sanchez@uni.edu'
  )
ON CONFLICT DO NOTHING;

-- Game Night – 35 attended
INSERT INTO pnm_attendance (pnm_id, event_id, status)
SELECT p.id, e.id, 'ATTENDED'
FROM pnms p, events e
WHERE e.event_name = 'Game Night'
  AND p.email IN (
    'james.carter@uni.edu',    'connor.wu@uni.edu',      'priya.sharma@uni.edu',
    'liam.anderson@uni.edu',   'jackson.harris@uni.edu', 'lucas.lewis@uni.edu',
    'aiden.walker@uni.edu',    'grayson.hernandez@uni.edu','sebastian.green@uni.edu',
    'tyler.brooks@uni.edu',    'noah.kim@uni.edu',       'ethan.thompson@uni.edu',
    'elijah.allen@uni.edu',    'mason.torres@uni.edu',   'caleb.baker@uni.edu',
    'eli.nelson@uni.edu',      'bryson.parker@uni.edu',  'jaxon.edwards@uni.edu',
    'finn.reed@uni.edu',       'dominic.morgan@uni.edu', 'silas.rivera@uni.edu',
    'emmett.richardson@uni.edu','rowan.howard@uni.edu',  'knox.gray@uni.edu',
    'beckett.james@uni.edu',   'miles.brooks@uni.edu',   'griffin.sanders@uni.edu',
    'caden.barnes@uni.edu',    'dawson.henderson@uni.edu','hunter.roberts@uni.edu',
    'declan.phillips@uni.edu', 'wyatt.mitchell@uni.edu', 'reid.morris@uni.edu',
    'zane.bennett@uni.edu',    'theo.torres@uni.edu'
  )
ON CONFLICT DO NOTHING;

-- Bid Night – 25 attended (PNMs with a status_type set)
INSERT INTO pnm_attendance (pnm_id, event_id, status)
SELECT p.id, e.id, 'ATTENDED'
FROM pnms p, events e
WHERE e.event_name = 'Bid Night'
  AND p.email IN (
    'james.carter@uni.edu',    'aisha.patel@uni.edu',    'elena.rivera@uni.edu',
    'liam.anderson@uni.edu',   'isabella.clark@uni.edu', 'harper.hall@uni.edu',
    'grayson.hernandez@uni.edu','violet.adams@uni.edu',  'mason.torres@uni.edu',
    'elijah.allen@uni.edu',    'caleb.baker@uni.edu',    'eli.nelson@uni.edu',
    'stella.perez@uni.edu',    'hunter.roberts@uni.edu', 'isla.evans@uni.edu',
    'everett.stewart@uni.edu', 'aurora.sanchez@uni.edu', 'chloe.rogers@uni.edu',
    'lydia.bell@uni.edu',      'silas.rivera@uni.edu',   'emmett.richardson@uni.edu',
    'adeline.ward@uni.edu',    'genevieve.ramirez@uni.edu','miles.brooks@uni.edu',
    'dawson.henderson@uni.edu'
  )
ON CONFLICT DO NOTHING;

-- ---------------------------------------------------------------------------
-- Users & Roles
-- Sample password hashes use bcrypt with 10 rounds for 'password123'
-- ---------------------------------------------------------------------------

INSERT INTO users (username, email, password_hash) VALUES
    ('admin_user', 'admin@example.com', '$2b$10$PZPTDZjfTglQ0hYD3Ljdw.eburMU3HOYTTC4dUWMXrf16xPC8Etri'),
    ('dic_user',   'dic@example.com',   '$2b$10$PZPTDZjfTglQ0hYD3Ljdw.eburMU3HOYTTC4dUWMXrf16xPC8Etri'),
    ('std_user',   'user@example.com',  '$2b$10$PZPTDZjfTglQ0hYD3Ljdw.eburMU3HOYTTC4dUWMXrf16xPC8Etri')
ON CONFLICT (username) DO NOTHING;

INSERT INTO user_roles (user_id, role_name)
SELECT user_id, 'ADMIN'::role FROM users WHERE username = 'admin_user'
ON CONFLICT (user_id, role_name) DO NOTHING;

INSERT INTO user_roles (user_id, role_name)
SELECT user_id, 'DIC'::role FROM users WHERE username = 'dic_user'
ON CONFLICT (user_id, role_name) DO NOTHING;

INSERT INTO user_roles (user_id, role_name)
SELECT user_id, 'USER'::role FROM users WHERE username = 'std_user'
ON CONFLICT (user_id, role_name) DO NOTHING;
