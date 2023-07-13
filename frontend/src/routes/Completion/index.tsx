import { Text, Box, Center, Button } from "@chakra-ui/react";
import { useNavigate } from 'react-router-dom';
import "./Completion.css"

function Completion() {
    const navigate = useNavigate()
    function onClickHome() {
        navigate('/')
    }
    return (
        <div className="Completion_box">
            <Box h='700px' justifyContent='center' alignItems='center'>
                <Center h='100%'>
                    <Text textAlign="center" fontSize='4xl'>これで被験者実験を終了します。<br />お疲れ様でした。</Text>
                </Center> 
            </Box>

            <Button 
            onClick={onClickHome} 
            variant={'outline'} 
            colorScheme='green' 
            size='lg'
            >
            終了する
            </Button>
        </div>
        
    );
}

export default Completion