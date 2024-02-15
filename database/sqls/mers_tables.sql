CREATE TABLE IF NOT EXISTS conditions (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(64),
    mediatype VARCHAR(64),
    number_of_media INT UNSIGNED, 
    rating_second_by_media INT UNSIGNED,    
    dataset VARCHAR(64),
    platform VARCHAR(64),
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS channels(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    condition_id INT UNSIGNED,
    channel_num INT UNSIGNED,
    channel_name VARCHAR(64),
    FOREIGN KEY (condition_id) REFERENCES conditions(id) ON DELETE RESTRICT ON UPDATE CASCADE
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS trials(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    condition_id INT UNSIGNED,
    pre_started_at DATETIME NOT NULL,
    started_at DATETIME NOT NULL,
    ended_at DATETIME NOT NULL,
    FOREIGN KEY (condition_id) REFERENCES conditions(id) ON DELETE RESTRICT ON UPDATE CASCADE
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
    analyzed_signal_filename VARCHAR(128) NOT NULL,
    raw_signal_filename VARCHAR(64) NOT NULL,
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS calibrations(
    id INT UNSIGNED PRIMARY KEY,
    trial_id INT UNSIGNED,
    calibration VARCHAR(128) NOT NULL,  
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS trend_ranges(
    id INT UNSIGNED PRIMARY KEY,
    trial_id INT UNSIGNED,
    trend_range TEXT NOT NULL, 
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ratingとimagesの関係は1対1
CREATE TABLE IF NOT EXISTS images(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    filename VARCHAR(64) NOT NULL
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ratingとimagesの関係は1対1
CREATE TABLE IF NOT EXISTS movies(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
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
    FOREIGN KEY (image_id) REFERENCES images(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE RESTRICT ON UPDATE CASCADE
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Acorns 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Astronaut 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bark 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Beach 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Beach 7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bird 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bloody knife 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bored pose 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bored pose 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Boxing 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Car crash 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Cardboard 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Cat 5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Clean 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Couple 4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Cups 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Destruction 10.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Destruction 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Destruction 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dirt 5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog 12.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog 18.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog 19.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog 5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog 6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog attack 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog attack 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Eating 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Elephant 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Explosion 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Explosion 4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Father 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Feces 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Feces 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Ferret 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fire 7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fire 9.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fireworks 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fireworks 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fireworks 7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Flowers 6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Food 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Frustrated pose 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Frustrated pose 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Frustrated pose 7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Galaxy 8.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage dump 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage dump 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage dump 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage dump 4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage dump 5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage dump 6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage dump 7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage dump 8.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass 4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass 5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass 7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Hallway 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Hangover 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Happy face 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Intensity 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Jail 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Jail 4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'KKK rally 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake 12.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake 14.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake 15.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake 16.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Miserable pose 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Mother 6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Mother 7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Neutral face 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Opossum 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Ornament 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Paper 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Parachuting 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Penguins 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Pinecone 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Pinecone 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Present 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Prison 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Pumpkin 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rafting 5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rainbow 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rocks 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rocks 4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Roofing 4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Scared face 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Scary face 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'School 6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shark 4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shooting 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shot 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shot 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shot 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Sidewalk 6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Skydiving 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Skydiving 5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snake 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snake 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snake 6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snow 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snow 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Statue 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Sunset 4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Surgery 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Thunderstorm 3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Toilet 4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Tornado 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'War 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'War 6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wedding 12.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wedding 4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Windmill 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wolf 2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Yarn 1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Yarn 3.jpg');
