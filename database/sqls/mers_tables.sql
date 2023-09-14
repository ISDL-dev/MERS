CREATE TABLE IF NOT EXISTS trials(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(64),
    pre_trial_started_at DATETIME NOT NULL,
    trial_started_at DATETIME NOT NULL,
    trial_ended_at DATETIME NOT NULL,
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- trialsとsubjectsの関係は1対1
CREATE TABLE IF NOT EXISTS subjects(
    trial_id INT UNSIGNED PRIMARY KEY,
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
    distance_left_right_jaw_hinge FLOAT NOT NULL,
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE,
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- trialsとsignalsの関係は1対1
CREATE TABLE IF NOT EXISTS signals(
    trial_id INT UNSIGNED PRIMARY KEY,
    trend_range TEXT NOT NULL,
    channel_types VARCHAR(128) NOT NULL,
    calibration VARCHAR(128) NOT NULL,
    analyzed_signal_filename VARCHAR(128) NOT NULL,
    raw_signal_filename VARCHAR(64) NOT NULL,
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE,
)

-- trialsとratingの関係は1対多
CREATE TABLE IF NOT EXISTS rating(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    valence FLOAT NOT NULL,
    arousal FLOAT NOT NULL,
    liking FLOAT,
    dominance FLOAT,
    famility FLOAT,
    trial_id INT UNSIGNED NOT NULL,
    image_filename VARCHAR(128),
    movie_filename VARCHAR(128),
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE,
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- trialsとimagesの関係は1対1
CREATE TABLE IF NOT EXISTS images(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    filename VARCHAR(64) NOT NULL,
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- trialsとimagesの関係は1対1
CREATE TABLE IF NOT EXISTS movies(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    filename VARCHAR(64) NOT NULL,
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
