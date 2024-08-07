-- --------------------------------------
-- Master tables
-- --------------------------------------

CREATE TABLE IF NOT EXISTS conditions(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    condition_name VARCHAR(64) NOT NULL,
    location VARCHAR(64) NOT NULL,
    mediatype VARCHAR(64) NOT NULL,
    number_of_media INT UNSIGNED NOT NULL, 
    rating_second_by_media INT UNSIGNED NOT NULL,    
    dataset VARCHAR(64) NOT NULL,
    platform VARCHAR(64) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS channels(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    channel_name VARCHAR(64) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS channel_types(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    channel_type_name VARCHAR(64) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS images(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    dataset VARCHAR(64) NOT NULL,
    filename VARCHAR(64) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS movies(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    dataset VARCHAR(64) NOT NULL,
    filename VARCHAR(64) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------
-- Transaction tables
-- --------------------------------------

CREATE TABLE IF NOT EXISTS trials(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    condition_id INT UNSIGNED NOT NULL,
    channel_type_id INT UNSIGNED NOT NULL,
    pre_started_at DATETIME NOT NULL,
    started_at DATETIME NOT NULL,
    ended_at DATETIME NOT NULL,
    FOREIGN KEY (condition_id) REFERENCES conditions(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (channel_type_id) REFERENCES channel_types(id) ON DELETE RESTRICT ON UPDATE CASCADE
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS subjects(
    trial_id INT UNSIGNED PRIMARY KEY,
    name VARCHAR(64),
    age INT UNSIGNED,
    gender VARCHAR(64),
    handedness VARCHAR(64),
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
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS signals(
    trial_id INT UNSIGNED PRIMARY KEY,
    analyzed_signal_filename VARCHAR(128) NOT NULL,
    raw_signal_filename VARCHAR(64) NOT NULL,
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS calibrations(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    trial_id INT UNSIGNED,
    calibration VARCHAR(128) NOT NULL,  
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS trend_ranges(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    trial_id INT UNSIGNED,
    trend_range TEXT NOT NULL, 
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS rating(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    trial_id INT UNSIGNED,
    image_id INT UNSIGNED,
    movie_id INT UNSIGNED,
    valence FLOAT NOT NULL,
    arousal FLOAT NOT NULL,
    liking FLOAT,
    dominance FLOAT,
    famility FLOAT,
    FOREIGN KEY (trial_id) REFERENCES trials(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (image_id) REFERENCES images(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE RESTRICT ON UPDATE CASCADE
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------
-- Association tables
-- --------------------------------------

CREATE TABLE IF NOT EXISTS channel_relations(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    channel_type_id INT UNSIGNED NOT NULL,
    channel_number INT UNSIGNED NOT NULL,
    channel_id INT UNSIGNED,
    FOREIGN KEY (channel_type_id) REFERENCES channel_types(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (channel_id) REFERENCES channels(id) ON DELETE RESTRICT ON UPDATE CASCADE
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- --------------------------------------
-- Insert data
-- --------------------------------------

-- Insert experimental conditions
INSERT INTO conditions(
    condition_name,
    location,
    mediatype,
    number_of_media, 
    rating_second_by_media,
    dataset,
    platform
) VALUES ('ExprimentalCondition1','KC111','image',120,15,'OASIS','KC111-BrightSign-Web');

-- Insert channel
INSERT INTO channels (channel_name) VALUES ('Fp1');
INSERT INTO channels (channel_name) VALUES ('AF3');
INSERT INTO channels (channel_name) VALUES ('F3');
INSERT INTO channels (channel_name) VALUES ('F7');
INSERT INTO channels (channel_name) VALUES ('FC5');
INSERT INTO channels (channel_name) VALUES ('FC1');
INSERT INTO channels (channel_name) VALUES ('C3');
INSERT INTO channels (channel_name) VALUES ('T7');
INSERT INTO channels (channel_name) VALUES ('CP5');
INSERT INTO channels (channel_name) VALUES ('CP1');
INSERT INTO channels (channel_name) VALUES ('P3');
INSERT INTO channels (channel_name) VALUES ('P7');
INSERT INTO channels (channel_name) VALUES ('PO3');
INSERT INTO channels (channel_name) VALUES ('O1');
INSERT INTO channels (channel_name) VALUES ('Oz');
INSERT INTO channels (channel_name) VALUES ('Pz');
INSERT INTO channels (channel_name) VALUES ('Fp2');
INSERT INTO channels (channel_name) VALUES ('AF4');
INSERT INTO channels (channel_name) VALUES ('Fz');
INSERT INTO channels (channel_name) VALUES ('F4');
INSERT INTO channels (channel_name) VALUES ('F8');
INSERT INTO channels (channel_name) VALUES ('FC6');
INSERT INTO channels (channel_name) VALUES ('FC2');
INSERT INTO channels (channel_name) VALUES ('Cz');
INSERT INTO channels (channel_name) VALUES ('C4');
INSERT INTO channels (channel_name) VALUES ('T8');
INSERT INTO channels (channel_name) VALUES ('CP6');
INSERT INTO channels (channel_name) VALUES ('CP2');
INSERT INTO channels (channel_name) VALUES ('P4');
INSERT INTO channels (channel_name) VALUES ('P8');
INSERT INTO channels (channel_name) VALUES ('PO4');
INSERT INTO channels (channel_name) VALUES ('O2');
INSERT INTO channels (channel_name) VALUES ('A1');
INSERT INTO channels (channel_name) VALUES ('A2');
INSERT INTO channels (channel_name) VALUES ('flank');

-- Insert channel type
INSERT INTO channel_types(channel_type_name) VALUES ('ChannelType1');

-- Insert relationship between channels and channel types
INSERT INTO channel_relations(channel_type_id,channel_number,channel_id) VALUES (1,1,15);
INSERT INTO channel_relations(channel_type_id,channel_number,channel_id) VALUES (1,2,24);
INSERT INTO channel_relations(channel_type_id,channel_number,channel_id) VALUES (1,3,3);
INSERT INTO channel_relations(channel_type_id,channel_number,channel_id) VALUES (1,4,20);
INSERT INTO channel_relations(channel_type_id,channel_number,channel_id) VALUES (1,5,35);
INSERT INTO channel_relations(channel_type_id,channel_number,channel_id) VALUES (1,6,NULL);
INSERT INTO channel_relations(channel_type_id,channel_number,channel_id) VALUES (1,7,33);
INSERT INTO channel_relations(channel_type_id,channel_number,channel_id) VALUES (1,8,34);

-- Insert image
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Acorns_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Astronaut_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bark_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Beach_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Beach_7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bird_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bloody_knife_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bored_pose_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Bored_pose_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Boxing_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Car_crash_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Cardboard_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Cat_5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Clean_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Couple_4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Cups_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Destruction_10.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Destruction_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Destruction_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dirt_5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog_12.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog_18.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog_19.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog_5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog_6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog_attack_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Dog_attack_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Eating_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Elephant_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Explosion_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Explosion_4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Father_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Feces_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Feces_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Ferret_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fire_7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fire_9.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fireworks_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fireworks_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Fireworks_7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Flowers_6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Food_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Frustrated_pose_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Frustrated_pose_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Frustrated_pose_7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Galaxy_8.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage_dump_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage_dump_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage_dump_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage_dump_4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage_dump_5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage_dump_6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage_dump_7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Garbage_dump_8.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass_4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass_5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Grass_7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Hallway_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Hangover_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Happy_face_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Intensity_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Jail_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Jail_4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'KKK_rally_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake_12.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake_14.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake_15.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Lake_16.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Miserable_pose_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Mother_6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Mother_7.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Neutral_face_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Opossum_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Ornament_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Paper_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Parachuting_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Penguins_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Pinecone_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Pinecone_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Present_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Prison_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Pumpkin_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rafting_5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rainbow_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rocks_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Rocks_4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Roofing_4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Scared_face_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Scary_face_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'School_6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shark_4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shooting_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shot_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shot_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Shot_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Sidewalk_6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Skydiving_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Skydiving_5.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snake_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snake_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snake_6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snow_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Snow_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Statue_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Sunset_4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Surgery_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Thunderstorm_3.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Toilet_4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Tornado_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'War_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'War_6.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wedding_12.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wedding_4.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Windmill_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Wolf_2.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Yarn_1.jpg');
INSERT INTO images (dataset, filename) VALUES ('OASIS', 'Yarn_3.jpg');