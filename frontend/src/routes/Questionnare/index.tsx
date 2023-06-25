import { useState } from 'react'
import { useNavigate } from 'react-router-dom';
import { Button } from "@chakra-ui/react";

import { PostTrialsRequestSubject } from "../../schema";
import FormDescription from "../../features/FormDescription";
import SubjectForm from "../../features/SubjectForm"
import "./Questionnare.css"

function Questionnare() {
    const navigate = useNavigate()

    const [age, setAge] = useState(18)
    const [gender, setGender] = useState("")
    const [handedness, setHandedness] = useState("")
    const [vision, setVision] = useState("")
    const [visionAid, setVisionAid] = useState("")
    const [education, setEducation] = useState("")
    const [alcoholConsumption, setAlcoholConsumption] = useState("")
    const [coffeeConsumption, setCoffeeConsumption] = useState("")
    const [teaConsumption, setTeaConsumption] = useState("")
    const [tobaccoConsumption, setTobaccoConsumption] = useState("")
    const [drugConsumption, setDrugConsumption] = useState("")
    const [syndroms, setSyndroms] = useState("")
    const [hoursOfSleepLastNight, setHoursOfSleepLastNight] = useState(0)
    const [normalHoursOfSleep, setNormalHoursOfSleep] = useState(0)
    const [levelOfAlertness, setLevelOfAlertness] = useState("")
    const [distributePhysiologicalRecordings, setDistributePhysiologicalRecordings] = useState(false)
    const [publishAudioVisualRecordings, setPublishAudioVisualRecordings] = useState(false)
    const [headCircumference, setHeadCircumference] = useState(0)
    const [distanceNasionInion, setNasionInion] = useState(0)
    const [distanceLeftRightJawHinge, setDistanceLeftRightJawHinge] = useState(0)
    
    function onClickAnswer() {
        var subject: PostTrialsRequestSubject = {
            age: age,
            handedness: handedness,
            gender: gender,
            vision_aid: visionAid,
            education: education,
            alcohol_consumption: alcoholConsumption,
            coffee_consumption: coffeeConsumption,
            tea_consumption: teaConsumption,
            tobacco_consumption: tobaccoConsumption,
            drug_consumption: drugConsumption,
            syndroms: syndroms,
            hours_of_sleep_last_night: hoursOfSleepLastNight,
            normal_hours_of_sleep: normalHoursOfSleep,
            level_of_alertness: levelOfAlertness,
            distribute_physiological_recordings: distributePhysiologicalRecordings,
            publish_audio_visual_recordings: publishAudioVisualRecordings,
            head_circumference: headCircumference,
            distance_nasion_inion: distanceNasionInion,
            distance_left_right_jaw_hinge: distanceLeftRightJawHinge
        }
        console.log(subject)
        navigate('/experiment', {state: subject})
    }

    return(
        <div className="questionnare_box">
            <FormDescription/>
            <SubjectForm 
                age={3} 
                setAge={setAge}
                handedness={handedness}
                setHandedness={setHandedness}
                gender={gender}
                setGender={setGender}
                visionAid={visionAid}
                setVisionAid={setVisionAid}
                education={education}
                setEducation={setEducation}
                alcoholConsumption={alcoholConsumption}
                setAlcoholConsumption={setAlcoholConsumption}
                coffeeConsumption={coffeeConsumption}
                setCoffeeConsumption={setCoffeeConsumption}
                teaConsumption={teaConsumption}
                setTeaConsumption={setTeaConsumption}
                tobaccoConsumption={tobaccoConsumption}
                setTobaccoConsumption={setTobaccoConsumption}
                drugConsumption={drugConsumption}
                setDrugConsumption={setDrugConsumption}
                syndroms={syndroms}
                setSyndroms={setSyndroms}
                hoursOfSleepLastNight={hoursOfSleepLastNight}
                setHoursOfSleepLastNight={setHoursOfSleepLastNight}
                normalHoursOfSleep={normalHoursOfSleep}
                setNormalHoursOfSleep={setNormalHoursOfSleep}
                levelOfAlertness={levelOfAlertness}
                setLevelOfAlertness={setLevelOfAlertness}
                distributePhysiologicalRecordings={distributePhysiologicalRecordings}
                setDistributePhysiologicalRecordings={setDistributePhysiologicalRecordings}
                publishAudioVisualRecordings={publishAudioVisualRecordings}
                setPublishAudioVisualRecordings={setPublishAudioVisualRecordings}
                headCircumference={headCircumference}
                setHeadCircumference={setHeadCircumference}
                distanceNasionInion={distanceNasionInion}
                setDistanceNasionInion={setNasionInion}
                distanceLeftRightJawHinge={distanceLeftRightJawHinge}
                setDistanceLeftRightJawHinge={setDistanceLeftRightJawHinge}
            />
            <Button 
                onClick={onClickAnswer} 
                variant={'outline'} 
                colorScheme='green' 
                size='lg'
            >
                上記の内容で回答する
            </Button>
        </div>
    )
}

export default Questionnare
