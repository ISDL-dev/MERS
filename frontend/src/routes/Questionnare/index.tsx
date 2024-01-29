import { useState } from 'react'
import { useNavigate } from 'react-router-dom';
import { Button } from "@chakra-ui/react";
import { recordingStartApi } from '../../api';
import { PostTrialsRequestSubjectMetadata } from "../../schema";
import FormDescription from "../../features/FormDescription";
import SubjectForm from "../../features/SubjectForm"
import "./Questionnare.css"

function QuestionnarePage() {
    const navigate = useNavigate()

    const [age, setAge] = useState(20)
    const [gender, setGender] = useState("men")
    const [handedness, setHandedness] = useState("left_handed")
    const [vision, setVision] = useState("normal")
    const [visionAid, setVisionAid] = useState("unaided")
    const [education, setEducation] = useState("high_school")
    const [alcoholConsumption, setAlcoholConsumption] = useState("regularly")
    const [coffeeConsumption, setCoffeeConsumption] = useState("regularly")
    const [teaConsumption, setTeaConsumption] = useState("regularly")
    const [tobaccoConsumption, setTobaccoConsumption] = useState("regularly")
    const [drugConsumption, setDrugConsumption] = useState("")
    const [syndroms, setSyndroms] = useState("")
    const [hoursOfSleepLastNight, setHoursOfSleepLastNight] = useState(7)
    const [normalHoursOfSleep, setNormalHoursOfSleep] = useState(7)
    const [levelOfAlertness, setLevelOfAlertness] = useState("never")
    const [headCircumference, setHeadCircumference] = useState(15)
    const [distanceNasionInion, setDistanceNasionInion] = useState(15)
    const [distanceLeftRightJawHinge, setDistanceLeftRightJawHinge] = useState(15)
    
    async function onClickAnswer() {
        var subject: PostTrialsRequestSubjectMetadata = {
            age: age,
            handedness: handedness,
            gender: gender,
            vision: vision,
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
            head_circumference: headCircumference,
            distance_nasion_inion: distanceNasionInion,
            distance_left_right_jaw_hinge: distanceLeftRightJawHinge
        }
        try {
            const response = await recordingStartApi.getRecordingStart();
            if (response.status !== 200) {
                console.log(response);
            }
            console.log(response);
            navigate('/prerating', {state: subject})
        }
        catch (error) {
            console.log(error);
        }
    }

    return(
        <div className="questionnare_box">
            <FormDescription/>
            <SubjectForm 
                setAge={setAge}
                setHandedness={setHandedness}
                setGender={setGender}
                setVision={setVision}
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
