DROP TABLE IF EXISTS user_roles CASCADE;

CREATE TABLE user_roles (
    user_id     BIGINT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    role_name   role NOT NULL DEFAULT 'USER',

    PRIMARY KEY (user_id, role_name)
);

CREATE INDEX idx_user_roles_user_id ON user_roles(user_id);