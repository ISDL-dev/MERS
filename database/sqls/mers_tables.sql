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

INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Acorns1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Astronaut1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bark3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Beach1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Beach7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bird1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bloodyknife1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Boredpose2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Boredpose3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Boxing2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Carcash1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Cardboard3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Cat5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Clean1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Couple4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Cups3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Destruction10.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Destruction2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Destruction3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dirt5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog12.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog18.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog19.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dogattack1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dogattack3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Eating3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Elephant1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Explosion2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Explosion4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Father1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Feces1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Feces2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Ferret1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fire7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fire9.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fireworks1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fireworks3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fireworks7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Flowers6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Food3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Frustratedpose1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Frustratedpose3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Frustratedpose7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Galaxy8.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbagedump1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbagedump2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbagedump3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbagedump4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbagedump5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbagedump6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbagedump7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbagedump8.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Hallway1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Hangover1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Happyface1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Intensity1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Jail2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Jail4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'KKKrally2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake12.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake14.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake15.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake16.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Miserablepose2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Mother6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Mother7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Neutralface2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Opossum1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Ornament1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Paper3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Parachuting3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Penguins2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Pinecone1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Pinecone3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Present2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Prison2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Pumpkin1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rafting5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rainbow2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rocks1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rocks4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Roofing4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Scaredface3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Scaryface1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'School6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shark4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shooting1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shot1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shot2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shot3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Sidewalk6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Skydiving3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Skydiving5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snake1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snake2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snake6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snow1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snow2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Statue1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Sunset4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Surgery1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Thunderstorm3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Toilet4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Tornado1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'War1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'War6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wedding12.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wedding4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Windmill1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wolf2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Yarn1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Yarn3.jpg');
