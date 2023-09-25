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

-- trialsとsignalsの関係は1対1
CREATE TABLE IF NOT EXISTS signals(
    trial_id INT UNSIGNED PRIMARY KEY,
    trend_range TEXT NOT NULL,
    channel_types VARCHAR(128) NOT NULL,
    calibration VARCHAR(128) NOT NULL,
    analyzed_signal_filename VARCHAR(128) NOT NULL,
    raw_signal_filename VARCHAR(64) NOT NULL,
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE
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
