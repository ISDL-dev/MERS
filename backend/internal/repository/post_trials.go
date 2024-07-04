package repository

import (
	"fmt"

	"github.com/ISDL-dev/MERS/backend/internal/model"
	"github.com/ISDL-dev/MERS/backend/internal/schema"
)

func CreateTrial(trials schema.PostTrialsRequest) (id uint, err error) {
	insert, err := db.Prepare(
		`INSERT INTO trials(
			condition_id,
			channel_type_id,
			pre_started_at, 
			started_at, 
			ended_at
		) VALUES(?, ?, ?, ?, ?)`)
	if err != nil {
		return id, fmt.Errorf("failed to prepare for a query to insert trial: %v", err)
	}
	result, err := insert.Exec(
		trials.TrialMetadata.ConditionId,
		trials.TrialMetadata.ChannelTypeId,
		trials.TrialMetadata.PreStartedAt,
		trials.TrialMetadata.StartedAt,
		trials.TrialMetadata.EndedAt,
	)
	if err != nil {
		return id, fmt.Errorf("failed to execute a query to insert trial: %v", err)
	}
	lastInsertId, err := result.LastInsertId()
	if err != nil {
		return id, fmt.Errorf("failed to get last insert id: %v", err)
	}
	return uint(lastInsertId), nil
}

func CreateSubject(trialId uint, subject schema.PostTrialsRequestSubjectMetadata) error {
	insert, err := db.Prepare(
		`INSERT INTO subjects(
			trial_id,
			name,
			age,
			gender,
			handedness,
			vision,
			vision_aid,
			education,
			alcohol_consumption,
			coffee_consumption,
			tea_consumption,
			tobacco_consumption,
			drug_consumption,
			syndroms,
			hours_of_sleep_last_night,
			normal_hours_of_sleep,
			level_of_alertness,
			head_circumference,
			distance_nasion_inion,
			distance_left_right_jaw_hinge
		) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`)
	if err != nil {
		return fmt.Errorf("failed to prepare for a query to insert subject: %v", err)
	}
	_, err = insert.Exec(
		trialId,
		subject.Name,
		subject.Age,
		subject.Gender,
		subject.Handedness,
		subject.Vision,
		subject.VisionAid,
		subject.Education,
		subject.AlcoholConsumption,
		subject.CoffeeConsumption,
		subject.TeaConsumption,
		subject.TobaccoConsumption,
		subject.DrugConsumption,
		subject.Syndroms,
		subject.HoursOfSleepLastNight,
		subject.NormalHoursOfSleep,
		subject.LevelOfAlertness,
		subject.HeadCircumference,
		subject.DistanceNasionInion,
		subject.DistanceLeftRightJawHinge,
	)
	if err != nil {
		return fmt.Errorf("failed to execute a query to insert subject: %v", err)
	}
	return nil
}

func CreateSignal(trialId uint, signal model.Signal) error {
	insert, err := db.Prepare(
		`INSERT INTO signals(
			trial_id,
			trend_range,
			channel_types,
			calibration,
			analyzed_signal_filename,
			raw_signal_filename
		) VALUES(?, ?, ?, ?, ?, ?)`)
	if err != nil {
		return fmt.Errorf("failed to prepare for a query to insert signal: %v", err)
	}
	_, err = insert.Exec(
		trialId,
		signal.TrendRange,
		signal.ChannelTypes,
		signal.Calibration,
		signal.AnalyzedSignalFilename,
		signal.RawSignalFilename,
	)
	if err != nil {
		return fmt.Errorf("failed to execute a query to insert signal: %v", err)
	}
	return nil
}

func CreateImageRating(trialId uint, imageId uint, emotion schema.PostTrialsRequestRatingSetRatingInnerEmotion) error {
	insert, err := db.Prepare(
		`INSERT INTO rating(
			valence,
			arousal,
			liking,
			dominance,
			famility,
			trial_id,
			image_id
		) VALUES(?, ?, ?, ?, ?, ?, ?)`)
	if err != nil {
		return fmt.Errorf("failed to prepare for a query to insert emotion: %v", err)
	}
	if _, err := insert.Exec(
		emotion.Valence,
		emotion.Arousal,
		emotion.Liking,
		emotion.Dominance,
		emotion.Famility,
		trialId,
		imageId,
	); err != nil {
		return fmt.Errorf("failed to execute a query to insert emotion: %v", err)
	}

	return nil
}

func CreateMovieRating(trialId uint, movieId uint, emotion schema.PostTrialsRequestRatingSetRatingInnerEmotion) error {
	insert, err := db.Prepare(
		`INSERT INTO rating(
			valence,
			arousal,
			liking,
			dominance,
			famility,
			trial_id,
			movie_id
		) VALUES(?, ?, ?, ?, ?, ?, ?)`)
	if err != nil {
		return fmt.Errorf("failed to prepare for a query to insert emotion: %v", err)
	}
	if _, err := insert.Exec(
		emotion.Valence,
		emotion.Arousal,
		emotion.Liking,
		emotion.Dominance,
		emotion.Famility,
		trialId,
		movieId,
	); err != nil {
		return fmt.Errorf("failed to execute a query to insert emotion: %v", err)
	}
	return nil
}

func GetImageId(dataset string, filename string) (id uint, err error) {
	query := `SELECT id FROM images WHERE dataset = ? AND filename = ?`
	if err := db.QueryRow(query, dataset, filename).Scan(&id); err != nil {
		return id, fmt.Errorf(
			"failed to execute a query to get image_id: dataset=%s, filename=%s: %v", dataset, filename, err)
	}
	return id, nil
}

func GetMovieId(dataset string, filename string) (id uint, err error) {
	query := `SELECT id FROM movies WHERE dataset = ? AND filename = ?`
	if err := db.QueryRow(query, dataset, filename).Scan(&id); err != nil {
		return id, fmt.Errorf("failed to execute a query to get movie_id: %v", err)
	}
	return id, nil
}
