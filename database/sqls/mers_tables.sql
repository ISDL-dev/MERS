CREATE TABLE IF NOT EXISTS subjects(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    age INT UNSIGNED NOT NULL,
    gender VARCHAR(64) NOT NULL,
    handedness VARCHAR(64) NOT NULL,
    vision VARCHAR(64) NOT NULL,
    vision_aid VARCHAR(64) NOT NULL,
    education VARCHAR(64) NOT NULL,
    alcohol_consumption VARCHAR(64) NOT NULL,
    coffee_consumption VARCHAR(64) NOT NULL,
    tea_consumption VARCHAR(64) NOT NULL,
    tobacco_consumption VARCHAR(64) NOT NULL,
    drug_consumption VARCHAR(64) NOT NULL,
    syndroms VARCHAR(64) NOT NULL,
    hours_of_sleep_last_night FLOAT NOT NULL,
    normal_hours_of_sleep FLOAT NOT NULL,
    level_of_alertness VARCHAR(64) NOT NULL,
    distribute_physiological_recordings BOOLEAN NOT NULL,
    publish_audio_visual_recordings BOOLEAN NOT NULL,
    head_circumference FLOAT NOT NULL,
    distance_nasion_inion FLOAT NOT NULL,
    distance_left_right_jaw_hinge FLOAT NOT NULL
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS images(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    google_drive_id VARCHAR(64) NOT NULL
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS movies(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    google_drive_id VARCHAR(64) NOT NULL
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS emotions(
    trial_id INT UNSIGNED,
    image_id INT UNSIGNED,
    movie_id INT UNSIGNED,
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    valence FLOAT NOT NULL,
    arousal FLOAT NOT NULL,
    liking FLOAT NOT NULL,
    dominance FLOAT NOT NULL,
    famility FLOAT NOT NULL,
    FOREIGN KEY (trial_id) REFERENCES subjects(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (image_id) REFERENCES images(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE ON UPDATE CASCADE
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS signals(
    trial_id INT UNSIGNED,
    image_id INT UNSIGNED,
    movie_id INT UNSIGNED,
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    filename VARCHAR(64) NOT NULL,
    pre_trial_started_at DATETIME NOT NULL,
    trial_started_at DATETIME NOT NULL,
    trial_ended_at DATETIME NOT NULL,
    FOREIGN KEY (trial_id) REFERENCES subjects(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (image_id) REFERENCES images(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE ON UPDATE CASCADE
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS trials(
    trial_id INT UNSIGNED,
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    date DATETIME NOT NULL,
    location VARCHAR(64) NOT NULL,
    FOREIGN KEY (trial_id) REFERENCES subjects(id)
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

