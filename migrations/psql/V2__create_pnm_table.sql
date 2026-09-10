DROP TABLE IF EXISTS pnms CASCADE;

CREATE TABLE pnms
(
    id           BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name   VARCHAR(50)  NOT NULL,
    last_name    VARCHAR(50)  NOT NULL,
    class_year   class_year   NOT NULL,
    status_type  status_type,
    email        VARCHAR(254) NOT NULL,
    phone_number VARCHAR(20)  NOT NULL,
    photo_url    VARCHAR(2048)
);