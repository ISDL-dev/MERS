/*
 * MERS API
 *
 * No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
 *
 * API version: 1.0.0
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

package openapi

type TrialsPostRequestSubject struct {

	ParticipantId int32 `json:"Participant_id,omitempty"`

	Age int32 `json:"Age,omitempty"`

	Gender string `json:"Gender,omitempty"`

	Handedness string `json:"Handedness,omitempty"`

	Vision string `json:"Vision,omitempty"`

	VisionAid string `json:"Vision_Aid,omitempty"`

	Education string `json:"Education,omitempty"`

	AlcoholConsumption string `json:"Alcohol_consumption,omitempty"`

	CoffeeConsumption string `json:"coffee_consumption,omitempty"`

	TeaConsumption string `json:"tea_consumption,omitempty"`

	TobaccoConsumption string `json:"tobacco_consumption,omitempty"`

	DrugConsumption string `json:"drug_consumption,omitempty"`

	Syndroms string `json:"syndroms,omitempty"`

	HoursOfSleepLastNight float32 `json:"Hours_of_sleep_last_night,omitempty"`

	NormalHoursOfSleep float32 `json:"Normal_hours_of_sleep,omitempty"`

	LevelOfAlertness string `json:"Level_of_Alertness,omitempty"`

	DistributePhysiologicalRecordings bool `json:"distribute_physiological_recordings,omitempty"`

	PublishAudioVisualRecordings bool `json:"publish_audio_visual_recordings,omitempty"`

	HeadCircumference float32 `json:"head_circumference,omitempty"`

	DistanceNasionInion float32 `json:"Distance_Nasion-Inion,omitempty"`

	DistanceLeftRightJawHinge float32 `json:"Distance_left-right_jaw_hinge,omitempty"`
}
