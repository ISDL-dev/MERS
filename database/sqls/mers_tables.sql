CREATE TABLE IF NOT EXISTS trials(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(64),
    platform VARCHAR(64),
    pre_started_at DATETIME NOT NULL,
    started_at DATETIME NOT NULL,
    ended_at DATETIME NOT NULL,
    rating_second_by_media INT UNSIGNED,
    number_of_medias INT UNSIGNED
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- trialsとsubjectsの関係は1対1
CREATE TABLE IF NOT EXISTS subjects(
    trial_id INT UNSIGNED PRIMARY KEY,
    age INT UNSIGNED,
    gender VARCHAR(64),
    handedness VARCHAR(64) ,
    vision VARCHAR(64),
    vision_aid VARCHAR(64),
    education VARCHAR(64),
    alcohol_consumption VARCHAR(64),
    coffee_consumption VARCHAR(64),
    tea_consumption VARCHAR(64),
    tobacco_consumption VARCHAR(64),
    drug_consumption VARCHAR(64),
    syndroms VARCHAR(64),
    hours_of_sleep_last_night FLOAT,
    normal_hours_of_sleep FLOAT,
    level_of_alertness VARCHAR(64),
    head_circumference FLOAT,
    distance_nasion_inion FLOAT,
    distance_left_right_jaw_hinge FLOAT,
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ratingとimagesの関係は1対1
CREATE TABLE IF NOT EXISTS channels(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    channel_name VARCHAR(64)
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- trialsとsignalsの関係は1対1
CREATE TABLE IF NOT EXISTS signals(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    trend_range TEXT NOT NULL,
    calibration VARCHAR(128) NOT NULL,
    analyzed_signal_filename VARCHAR(128) NOT NULL,
    raw_signal_filename VARCHAR(64) NOT NULL,
    trial_id INT UNSIGNED NOT NULL,
    channel_id INT UNSIGNED,
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (channel_id) REFERENCES channels(id) ON DELETE CASCADE ON UPDATE CASCADE
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ratingとimagesの関係は1対1
CREATE TABLE IF NOT EXISTS images(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    dataset VARCHAR(64),
    filename VARCHAR(64) NOT NULL
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ratingとimagesの関係は1対1
CREATE TABLE IF NOT EXISTS movies(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    dataset VARCHAR(64),
    filename VARCHAR(64) NOT NULL
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- trialsとratingの関係は1対多
CREATE TABLE IF NOT EXISTS rating(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    valence FLOAT NOT NULL,
    arousal FLOAT NOT NULL,
    liking FLOAT,
    dominance FLOAT,
    famility FLOAT,
    trial_id INT UNSIGNED NOT NULL,
    image_id INT UNSIGNED,
    movie_id INT UNSIGNED,
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (image_id) REFERENCES images(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE ON UPDATE CASCADE
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 画像挿入
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Beach1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bricks1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Cardboard3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Cat5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Cottonswabs3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Deadbodies1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Deadbodies2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Deadbodies3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Destruction3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Destruction4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dirt1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog18.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog26.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dummy1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Explosion5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fireworks2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbagedump2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbagedump4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbagedump6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Injury4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake12.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake14.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake15.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake8.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake9.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Miserablepose3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rainbow2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Siblings1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Sidewalk6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wall1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wall2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wall4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wall5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'War6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Yarn1.jpg');

-- channelの追加
INSERT INTO channels (channel_name) VALUES ('AF3');
INSERT INTO channels (channel_name) VALUES ('AF4');
INSERT INTO channels (channel_name) VALUES ('Cz');
INSERT INTO channels (channel_name) VALUES ('C5');
INSERT INTO channels (channel_name) VALUES ('C6');
INSERT INTO channels (channel_name) VALUES ('Oz');


