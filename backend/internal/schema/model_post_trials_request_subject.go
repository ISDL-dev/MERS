/*
 * MERS API
 *
 * No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
 *
 * API version: 1.0.0
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

package schema

type PostTrialsRequestSubject struct {

	Id int32 `json:"id,omitempty"`

	Age int32 `json:"age,omitempty"`

	Gender string `json:"gender,omitempty"`

	Handedness string `json:"handedness,omitempty"`

	Vision string `json:"vision,omitempty"`

	VisionAid string `json:"vision_aid,omitempty"`

	Education string `json:"education,omitempty"`

	AlcoholConsumption string `json:"alcohol_consumption,omitempty"`

	CoffeeConsumption string `json:"coffee_consumption,omitempty"`

	TeaConsumption string `json:"tea_consumption,omitempty"`

	TobaccoConsumption string `json:"tobacco_consumption,omitempty"`

	DrugConsumption string `json:"drug_consumption,omitempty"`

	Syndroms string `json:"syndroms,omitempty"`

	HoursOfSleepLastNight float32 `json:"hours_of_sleep_last_night,omitempty"`

	NormalHoursOfSleep float32 `json:"normal_hours_of_sleep,omitempty"`

	LevelOfAlertness string `json:"level_of_alertness,omitempty"`

	DistributePhysiologicalRecordings bool `json:"distribute_physiological_recordings,omitempty"`

	PublishAudioVisualRecordings bool `json:"publish_audio_visual_recordings,omitempty"`

	HeadCircumference float32 `json:"head_circumference,omitempty"`

	DistanceNasionInion float32 `json:"distance_nasion_inion,omitempty"`

	DistanceLeftRightJawHinge float32 `json:"distance_left_right_jaw_hinge,omitempty"`
}

