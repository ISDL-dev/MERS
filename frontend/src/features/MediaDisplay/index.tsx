import { Box, Image} from '@chakra-ui/react'

import './MediaDisplay.css'

interface MediaDisplayProps {
    type: string
    src: string
}

function MediaDisplay(props: MediaDisplayProps) {
    switch(props.type) {
        case "image":
            return (
                <Box className='outer-box'>
                    <Image 
                        src={props.src}
                        className='inner-media'
                        alt='Dan Abramov'
                    />
                </Box>
            )
        case "video":
            return (
                <Box className='outer-box'>
                    <video
                        src={props.src}
                        className='inner-media'
                    />
                </Box>
            )
        default:
            return (
                <Box className='outer-box'></Box>
            )
    }
}

export default MediaDisplay
