import { useState } from 'react'
import { useNavigate } from 'react-router-dom';
import { Button } from "@chakra-ui/react";

import { PostTrialsRequestSubject } from "../../schema";
import FormDescription from "../../features/FormDescription";
import SubjectForm from "../../features/SubjectForm"
import "./Questionnare.css"

function QuestionnarePage() {
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
<<<<<<< Updated upstream
    const [hoursOfSleepLastNight, setHoursOfSleepLastNight] = useState(0)
    const [normalHoursOfSleep, setNormalHoursOfSleep] = useState(0)
    const [levelOfAlertness, setLevelOfAlertness] = useState("")
    const [distributePhysiologicalRecordings, setDistributePhysiologicalRecordings] = useState(false)
    const [publishAudioVisualRecordings, setPublishAudioVisualRecordings] = useState(false)
    const [headCircumference, setHeadCircumference] = useState(0)
    const [distanceNasionInion, setNasionInion] = useState(0)
    const [distanceLeftRightJawHinge, setDistanceLeftRightJawHinge] = useState(0)
=======
    const [hoursOfSleepLastNight, setHoursOfSleepLastNight] = useState(7)
    const [normalHoursOfSleep, setNormalHoursOfSleep] = useState(7)
    const [levelOfAlertness, setLevelOfAlertness] = useState("never")
    const [headCircumference, setHeadCircumference] = useState(15)
    const [distanceNasionInion, setDistanceNasionInion] = useState(15)
    const [distanceLeftRightJawHinge, setDistanceLeftRightJawHinge] = useState(15)
>>>>>>> Stashed changes
    
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
        navigate('/prerating', {state: subject})
    }

    return(
        <div className="questionnare_box">
            <FormDescription/>
            <SubjectForm 
                setAge={setAge}
                setHandedness={setHandedness}
                setGender={setGender}
                setVisionAid={setVisionAid}
                setEducation={setEducation}
                setAlcoholConsumption={setAlcoholConsumption}
                setCoffeeConsumption={setCoffeeConsumption}
                setTeaConsumption={setTeaConsumption}
                setTobaccoConsumption={setTobaccoConsumption}
                setDrugConsumption={setDrugConsumption}
                setSyndroms={setSyndroms}
                setHoursOfSleepLastNight={setHoursOfSleepLastNight}
                setNormalHoursOfSleep={setNormalHoursOfSleep}
                setLevelOfAlertness={setLevelOfAlertness}
                setDistributePhysiologicalRecordings={setDistributePhysiologicalRecordings}
                setPublishAudioVisualRecordings={setPublishAudioVisualRecordings}
                setHeadCircumference={setHeadCircumference}
                setDistanceNasionInion={setDistanceNasionInion}
                setDistanceLeftRightJawHinge={setDistanceLeftRightJawHinge}
            />
            <Button 
                onClick={onClickAnswer} 
                variant={'outline'} 
                colorScheme='green' 
                size='lg'
            >上記の内容で回答する</Button>
        </div>
    )
}

export default QuestionnarePage
