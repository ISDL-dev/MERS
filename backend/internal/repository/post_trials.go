package repository

import (
	"fmt"
	"log"

	"github.com/hoka-isdl/MERS/backend/internal/schema"
)

func CreateSubjectsRecords(subject schema.PostTrialsRequestSubject) error {
	insert, err := db.Prepare(`INSERT INTO subjects(age,gender,handedness,vision,vision_aid,education,alcohol_consumption,
		coffee_consumption,tea_consumption,tobacco_consumption,drug_consumption,syndroms,hours_of_sleep_last_night,normal_hours_of_sleep,
		level_of_alertness,distribute_physiological_recordings,publish_audio_visual_recordings,head_circumference,distance_nasion_inion,distance_left_right_jaw_hinge)
		VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`)
	if err != nil {
		return fmt.Errorf("failed to prepare for a query to insert subject: %v", err)
	}
	_, err = insert.Exec(subject.Age, subject.Gender, subject.Handedness, subject.Vision, subject.VisionAid, subject.Education,
		subject.AlcoholConsumption, subject.CoffeeConsumption, subject.TeaConsumption, subject.TobaccoConsumption,
		subject.DrugConsumption, subject.Syndroms, subject.HoursOfSleepLastNight, subject.NormalHoursOfSleep,
		subject.LevelOfAlertness, subject.DistributePhysiologicalRecordings, subject.PublishAudioVisualRecordings,
		subject.HeadCircumference, subject.DistanceNasionInion, subject.DistanceLeftRightJawHinge)
	if err != nil {
		return fmt.Errorf("failed to execute a query to insert subject: %v", err)
	}
	return nil
}

func CreateEmotionsRecords(subject schema.PostTrialsRequestSubject, rating []schema.PostTrialsRequestRatingsInner) error {
	insert, err := db.Prepare("INSERT INTO emotions(trial_id,image_id,valence,arousal,liking,dominance,famility) VALUES(?, ?, ?, ?, ?, ?, ?)")
	if err != nil {
		return fmt.Errorf("failed to prepare for a query to insert emotion: %v", err)
	}
	for i := 0; i < len(rating); i++ {
		if _, err := insert.Exec(
			subject.ParticipantId, rating[i].MediaId, rating[i].Emotions.Valence,
			rating[i].Emotions.Arousal, rating[i].Emotions.Liking,
			rating[i].Emotions.Dominance, rating[i].Emotions.Famility,
		); err != nil {
			return fmt.Errorf("failed to execute a query to insert emotion: %v", err)
		}
	}
	return nil
}

func CreateMediasRecords() {
	insert, err := db.Prepare("INSERT INTO medias(type,filename) VALUES(?, ?)")
	if err != nil {
		log.Fatal(err.Error())
	}

	insert.Exec("image", "sample.jpg")
}

func FindImageIdByName(filename string) (int, error) {
	var id int
	if err := db.QueryRow("SELECT id FROM medias WHERE filename = ?", filename).Scan(&id); err != nil {
		return 0, fmt.Errorf("failed to execute a query to find image id by name: %v", err)
	}
	return id, nil
}
