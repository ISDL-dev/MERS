import { Grid, GridItem } from '@chakra-ui/react'
import { useEffect, useRef, useState } from 'react'
import MediaDisplay from "../../features/MediaDisplay"
import "./MediaViewing.css"
import { useLocation, useNavigate } from 'react-router-dom'
interface RatingPageProps {
    mediaType: string
}
export const ratingSecondByMedia = 15;

// TODO: mediaTypeに応じて、利用するエンドポイントを切り替える
function RatingPage(props: RatingPageProps) {
    const [mediaSrc, setMediaSrc] = useState('');
    const navigate = useNavigate();
    const location = useLocation();
    const preStartedAt = location.state.pre_started_at;
    const mediaIndex = location.state.mediaIndex;
    const mediaBaseSrc = "./static/images/OASIS/";
    let startedAt = location.state.startedAt;
    const MediaList = location.state.MediaList;
    const ratingResult = location.state.ratingResult;
    const date_to_time = (date: Date) => {
        const time = date.getFullYear().toString() + "-" + 
        (date.getMonth() + 1).toString().padStart( 2, '0') + "-" + 
        date.getDate().toString().padStart( 2, '0') + " " +
        date.getHours().toString().padStart( 2, '0') + ":" + 
        date.getMinutes().toString().padStart( 2, '0') + ":" +
        date.getSeconds().toString().padStart( 2, '0');
        return time;
    }

    const forward = async () => {
        if (MediaList !== undefined) { 
            navigate('/rating', { state: { "MediaList": MediaList,"mediaIndex": mediaIndex,"subject": location.state.subject, "pre_started_at": preStartedAt,"startedAt":startedAt,"ratingResult":ratingResult} }); 

            const mediaFileName = MediaList[mediaIndex];   
            const mediaSrc = mediaBaseSrc+mediaFileName;
            setMediaSrc(mediaSrc);
        }
    }

    // TODO: dependenciesにvalence, arousalがあることでバー操作時に更新が止まらない（=カウントのリセットがおこる）
    useEffect(() => {
        const intervalId = setInterval(() => {
            forward();
        }, ratingSecondByMedia * 1000);
        return () => {
            clearInterval(intervalId);
        };
    }, []);

    useEffect(() => {
        if(mediaIndex===0){
            startedAt = date_to_time(new Date());
        }
        const mediaFileName = MediaList[mediaIndex];
            const mediaSrc = mediaBaseSrc+mediaFileName;
            setMediaSrc(mediaSrc);
    }, []);
    
    return (
    <Grid
        className='viewing_box'
        placeItems="center" 
        templateRows="repeat(1, 1fr)"
        templateColumns="repeat(1, 1fr)"
      >
        <GridItem rowSpan={1} colSpan={1} >
            <MediaDisplay type={props.mediaType} src={mediaSrc} />
        </GridItem>
    </Grid>
    );
}

export default RatingPage
