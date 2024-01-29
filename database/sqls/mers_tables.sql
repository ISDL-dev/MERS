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
    FOREIGN KEY (image_id) REFERENCES images(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE RESTRICT ON UPDATE CASCADE
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
