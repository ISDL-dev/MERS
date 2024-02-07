import { Grid, GridItem, Button } from '@chakra-ui/react'
import { useEffect, useRef, useState } from 'react'
import { trialsApi } from '../../api';
import { 
    PostTrialsRequest, 
    PostTrialsRequestTrialMetadata, 
    PostTrialsRequestRatingSet, 
    PostTrialsRequestRatingSetRatingInner, 
    PostTrialsRequestRatingSetRatingInnerEmotion 
} from "../../schema";
import MediaDisplay from "../../features/MediaDisplay"
import RatingSlider from "../../features/RatingSlider"
import MediaList from "../../../src/imageFileNames.json"
import "./MediaRating.css"
import { useLocation, useNavigate } from 'react-router-dom'
interface RatingPageProps {
    mediaType: string
}

const detasetName: string= "OASIS";
const experimentLocation: string = "KC111";
const platform: string = "";
const [rateMin, rateDefault, rateMax]: number[] = [1, 5, 9];
const mediaNum: number = 120;

// TODO: mediaTypeに応じて、利用するエンドポイントを切り替える
function RatingPage(props: RatingPageProps) {
    const ratingSecondByMedia: number = 15;
    const mediaIndexRef = useRef<number>(0);
    const [isVisible, setIsVisible] = useState<boolean>(false);
    const [mediaSrc, setMediaSrc] = useState<string>('');
    const valenceRef = useRef<number>(rateDefault);
    const arousalRef = useRef<number>(rateDefault);
    const navigate = useNavigate();
    const location = useLocation();
    const subjectMetadata = location.state.subject;
    const preStartedAt = location.state.preStartedAt;
    const [sliderValueTop, setSliderValueTop] = useState<number>(50);
    const [sliderValueBottom, setSliderValueBottom] = useState<number>(50);
    const mediaBaseSrc: string = "./static/images/OASIS/";
    const [startedAt, setstartedAt] = useState<string>("");
    const ratingResult: PostTrialsRequestRatingSetRatingInner[] = [];
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
        const mediaIndex: number = mediaIndexRef.current;
        if (MediaList !== undefined) { 
            const evaliationMediaFileName: string = MediaList[mediaIndex];           
            if (evaliationMediaFileName !== undefined) {
                const valence: number = valenceRef.current;
                const arousal: number = arousalRef.current;
                const ratingSetRatingInnerEmotion: PostTrialsRequestRatingSetRatingInnerEmotion = {
                    valence: valence,
                    arousal: arousal
                };
                const ratingSetRatingInner: PostTrialsRequestRatingSetRatingInner = {
                    dataset: detasetName, 
                    filename: evaliationMediaFileName, 
                    emotion: ratingSetRatingInnerEmotion
                };
                ratingResult.push(ratingSetRatingInner);
            }
            const doneToRateAllTargets: boolean = mediaIndex+1 === mediaNum;
            if (doneToRateAllTargets) {
                const endedAt: string= date_to_time(new Date());
                const trialMetadata: PostTrialsRequestTrialMetadata = {
                    location: experimentLocation,
                    platform: platform,
                    pre_started_at: preStartedAt,
                    started_at: startedAt,
                    ended_at: endedAt,
                    rating_second_by_media: ratingSecondByMedia,
                    number_of_medias: mediaNum
                };
                const ratingSet: PostTrialsRequestRatingSet = {
                    media_type: props.mediaType,
                    rating: ratingResult
                };
                const requestBody: PostTrialsRequest = {
                    trial_metadata: trialMetadata,
                    subject_metadata: subjectMetadata,
                    rating_set: ratingSet
                }
                console.log(requestBody);
                try {
                    const response = await trialsApi.postTrials(requestBody);
                    if (response.status !== 200) {
                        console.log(response);
                    }
                    navigate('/completion'); 
                }
                catch (error) {
                    console.log(error);
                }
                return;
            }
            setSliderValueTop(50);
            setSliderValueBottom(50);
            valenceRef.current = rateDefault;
            arousalRef.current = rateDefault;
            mediaIndexRef.current = mediaIndex + 1;
            showViewingPage();
            console.log("location.state", location.state);
        }
    }

    function onClickAnswer() {
        forward();
    }

    function showViewingPage() {
        setIsVisible(false);
        const mediaIndex: number = mediaIndexRef.current;
        const mediaFileName: string = MediaList[mediaIndex];
        const mediaSrc: string = mediaBaseSrc+mediaFileName;
        setMediaSrc(mediaSrc);
        setTimeout(() =>{
            setIsVisible(true);
        }
        , ratingSecondByMedia*1000);
    }
    useEffect(() => {
        setstartedAt(date_to_time(new Date()));
        MediaList.sort((a, b) => 0.5 - Math.random());
        showViewingPage();
    }, []);
    
    return (
        <Grid
            className='rating_box'
            templateRows='repeat(4, 1fr)'
            templateColumns='repeat(1, 1fr)'
            gap={6}
        >
            <GridItem rowSpan={1} colSpan={1}>
                <MediaDisplay
                    type={props.mediaType}
                    src={mediaSrc}
                />
            </GridItem>

            {isVisible && <GridItem rowSpan={1} colSpan={1} >
                <RatingSlider
                    rateValueRef={valenceRef}
                    sliderValue={sliderValueTop}
                    setSliderValue={setSliderValueTop}
                    min={rateMin}
                    max={rateMax}
                    label='Valence - 感情の快・不快'
                    minLabel='ネガティブ'
                    maxLabel='ポジティブ'
                />
            </GridItem>}

            {isVisible && <GridItem rowSpan={1} colSpan={1} >
                <RatingSlider 
                    rateValueRef={arousalRef}
                    sliderValue={sliderValueBottom}
                    setSliderValue={setSliderValueBottom}
                    min={rateMin}
                    max={rateMax}
                    label='Arousal - 感情の強さ'
                    minLabel='落ち着いている'
                    maxLabel='激しい'
                />
            </GridItem>}

            {isVisible && <GridItem rowSpan={1} colSpan={1} >
                <Button 
                onClick={onClickAnswer} 
                variant={'outline'} 
                colorScheme='green' 
                size='lg'
                >
                    Submit
                </Button>
            </GridItem>}

        </Grid>
    );
}

export default RatingPage