import { Text, Box, Center, Button } from "@chakra-ui/react";
import { useNavigate } from 'react-router-dom';
import "./Home.css"

function Home1() {
    const navigate = useNavigate()
    function onClickHome() {
        navigate('/questionnare')
    }
    return (
        <div className="home_box">
            <Box h='700px' justifyContent='center' alignItems='center'>
                <Center h='100%'>
                    <Text textAlign="center" fontSize='5xl' color="white">MERS1　</Text>
                    <Text textAlign="center" fontSize='3xl' color="white"> - Media Emotion Rating System -</Text>
                </Center> 
            </Box>

            <Button 
            onClick={onClickHome} 
            variant={'outline'} 
            colorScheme='green' 
            size='lg'
            >
            開始
            </Button>
        </div>
        
    );
}

export default Home