import { useState, useEffect } from 'react';
import { Text, Box, Center } from "@chakra-ui/react";
import { useNavigate } from 'react-router-dom';
// import "./Completion.css"

function PreRating() {
    const navigate = useNavigate()
    const [time, setTime] = useState(3);
    
    useEffect(() => {
        setTimeout(() => {
            const sec = time - 1;
            setTime(sec)
            if (sec===0){
                navigate("/rating")
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