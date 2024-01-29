import { useState, useEffect } from 'react';
import { Text, Box, Center } from "@chakra-ui/react";
import { useLocation, useNavigate } from 'react-router-dom'
import MediaList from "../../../src/imageFileNames.json"
import { 
    PostTrialsRequestRatingSetRatingInner, 
} from "../../schema";
// import "./Completion.css"

function PreRating() {
    const navigate = useNavigate();
    const location = useLocation();
    const [time, setTime] = useState(3);
    const [preStartedAt,setPreStartedAt] = useState("");

    const date_to_time = (date: Date) => {
        const time = date.getFullYear().toString() + "-" + 
        (date.getMonth() + 1).toString().padStart( 2, '0') + "-" + 
        date.getDate().toString().padStart( 2, '0') + " " +
        date.getHours().toString().padStart( 2, '0') + ":" + 
        date.getMinutes().toString().padStart( 2, '0') + ":" +
        date.getSeconds().toString().padStart( 2, '0');
        return time;
    }

    useEffect(() => {
        setPreStartedAt(date_to_time(new Date()))
    }, []);
    
    useEffect(() => {
        setTimeout(() => {
            const sec = time - 1;
            const mediaIndex = 0;
            const startedAt = ""
            const ratingResult: PostTrialsRequestRatingSetRatingInner[] = [];
            MediaList.sort((a, b) => 0.5 - Math.random());

            setTime(sec)
            if (sec===0){
                navigate("/viewing", {state: { "MediaList": MediaList,"mediaIndex": mediaIndex,"subject": location.state.subject, "pre_started_at": preStartedAt,"startedAt":startedAt,"ratingResult":ratingResult}});
            }
        },1000);
    });
    return (
        <div>
            <Box h='700px' justifyContent='center' alignItems='center'>
                <Center h='100%'>
                    <Text textAlign="center" fontSize='4xl'>{time}秒後に実験を開始します。</Text>
                </Center> 
            </Box>
        </div>
    );
}

export default PreRating