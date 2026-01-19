CREATE DATABASE IF NOT EXISTS youtube;
USE youtube;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id    INT AUTO_INCREMENT PRIMARY KEY,
    email      VARCHAR(100) UNIQUE                  NOT NULL,
    password   VARCHAR(15)                          NOT NULL,
    name       VARCHAR(15)                          NOT NULL,
    birth_date DATE                                 NOT NULL,
    gender     ENUM('Male', 'Female', 'Not Binary') NOT NULL,
    country    VARCHAR(100)                         NOT NULL,
    zip_code   INT                                  NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    name   VARCHAR(60)           NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS videos;
CREATE TABLE videos (
    video_id     INT AUTO_INCREMENT               PRIMARY KEY,
    user_id      INT                                 NOT NULL,
    title        VARCHAR(250)                        NOT NULL,
    description  TEXT                                    NULL,
    file_size    INT                                 NOT NULL,
    file_name    VARCHAR(60)                         NOT NULL,
    duration     TIME                                NOT NULL,
    thumbnail    VARCHAR(60)                         NOT NULL,
    views        BIGINT                             DEFAULT 0,
    likes        BIGINT                             DEFAULT 0,
    dislikes     BIGINT                             DEFAULT 0,
    video_state  ENUM('Public', 'Hidden', 'Private') NOT NULL,
    upload_date  DATETIME                            NOT NULL,
    CONSTRAINT fk_videos_user_id
        FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS channels;
CREATE TABLE channels (
    channel_id    INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(60)           NOT NULL,
    description   TEXT                  NOT NULL,
    user_id       INT                   NOT NULL,
    creation_date DATETIME              NOT NULL,
    CONSTRAINT fk_channels_user_id
        FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS playlists;
CREATE TABLE playlists (
    playlist_id   INT AUTO_INCREMENT     PRIMARY KEY,
    user_id       INT                       NOT NULL,
    name          VARCHAR(60)               NOT NULL,
    creation_date DATETIME                  NOT NULL,
    playlist_type ENUM('Public', 'Private') NOT NULL,
    CONSTRAINT fk_playlists_user_id
        FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS video_tags;
CREATE TABLE video_tags (
    video_id INT NOT NULL,
    tag_id   INT NOT NULL,
    PRIMARY KEY (video_id, tag_id),
    CONSTRAINT fk_v_tags_video_id
        FOREIGN KEY (video_id) REFERENCES videos(video_id),
    CONSTRAINT fk_v_tags_tag_id
        FOREIGN KEY (tag_id) REFERENCES  tags(tag_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS subscriptions;
CREATE TABLE subscriptions (
    subscription_id    INT AUTO_INCREMENT PRIMARY KEY,
    user_id            INT                   NOT NULL,
    channel_id         INT                   NOT NULL,
    CONSTRAINT fk_subscriptions_user_id
        FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_subscriptions_channel_id
        FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS video_likes;
CREATE TABLE video_likes (
    user_id   INT                     NOT NULL,
    video_id  INT                     NOT NULL,
    like_type ENUM('Like', 'Dislike') NOT NULL,
    creation_date DATETIME            NOT NULL,
    PRIMARY KEY (user_id, video_id),
    CONSTRAINT fk_v_likes_user_id
        FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_v_likes_video_id
        FOREIGN KEY (video_id) REFERENCES videos(video_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS videos_playlist;
CREATE TABLE videos_playlist (
    video_id    INT NOT NULL,
    playlist_id INT NOT NULL,
    PRIMARY KEY (video_id, playlist_id),
    CONSTRAINT fk_vs_playlist_video_id
        FOREIGN KEY (video_id) REFERENCES videos(video_id),
    CONSTRAINT fk_vs_playlist_playlist_id
        FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
    comment_id   INT AUTO_INCREMENT     PRIMARY KEY,
    video_id     INT                       NOT NULL,
    user_id      INT                       NOT NULL,
    text         TEXT                      NOT NULL,
    creation_date DATETIME                  NOT NULL,
    CONSTRAINT fk_comments_video_id
        FOREIGN KEY (video_id) REFERENCES videos(video_id),
    CONSTRAINT fk_comments_user_id
        FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS comment_likes;
CREATE TABLE comment_likes (
    comment_id INT                     NOT NULL,
    user_id    INT                     NOT NULL,
    like_type  ENUM('Like', 'Dislike') NOT NULL,
    creation_date  DATETIME                NOT NULL,
    PRIMARY KEY (comment_id, user_id),
    CONSTRAINT fk_c_likes_comment_id
        FOREIGN KEY (comment_id) REFERENCES comments(comment_id),
    CONSTRAINT fk_c_likes_user_id
        FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SET FOREIGN_KEY_CHECKS = 1;