package repository

import (
	"log"

	"github.com/hoka-isdl/MERS/backend/internal/schema"
)

func CreateSubjectsRecords(subject schema.PostTrialsRequestSubject) {
	insert, err := db.Prepare("INSERT INTO Subjects(age,gender,handedness,vision,vision_aid,education,alcohol_consumption," +
		"coffee_consumption,tea_consumption,tobacco_consumption,drug_consumption,syndroms,hours_of_sleep_last_night,normal_hours_of_sleep," +
		"level_of_alertness,distribute_physiological_recordings,publish_audio_visual_recordings,head_circumference,distance_nasion_inion,distance_left_right_jaw_hinge) " +
		"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
	if err != nil {
		log.Fatal(err.Error())
	}

	insert.Exec(subject.Age, subject.Gender, subject.Handedness, subject.Vision, subject.VisionAid, subject.Education,
		subject.AlcoholConsumption, subject.CoffeeConsumption, subject.TeaConsumption, subject.TobaccoConsumption,
		subject.DrugConsumption, subject.Syndroms, subject.HoursOfSleepLastNight, subject.NormalHoursOfSleep,
		subject.LevelOfAlertness, subject.DistributePhysiologicalRecordings, subject.PublishAudioVisualRecordings,
		subject.HeadCircumference, subject.DistanceNasionInion, subject.DistanceLeftRightJawHinge)
}

func CreateEmotionsRecords(subject schema.PostTrialsRequestSubject, rating []schema.PostTrialsRequestRatingsInner) {
	insert, err := db.Prepare("INSERT INTO Emotions(participant_id,media_id,valence,arousal,liking,dominance,famility) VALUES(?, ?, ?, ?, ?, ?, ?)")
	if err != nil {
		log.Fatal(err.Error())
	}

	for i := 0; i < len(rating); i++ {
		insert.Exec(subject.ParticipantId, rating[i].MediaId, rating[i].Emotions.Valence,
			rating[i].Emotions.Arousal, rating[i].Emotions.Liking,
			rating[i].Emotions.Dominance, rating[i].Emotions.Famility)
	}
}

func CreateMediasRecords() {
	insert, err := db.Prepare("INSERT INTO Medias(type,filename) VALUES(?, ?)")
	if err != nil {
		log.Fatal(err.Error())
	}

	insert.Exec("image", "sample.jpg")
}
