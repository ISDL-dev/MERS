import { Grid, GridItem } from '@chakra-ui/react'
import { useEffect, useRef, useState } from 'react'
import { PostTrialsRequest, PostTrialsRequestTrialMetadata, PostTrialsRequestRatingSet, PostTrialsRequestRatingSetRatingInner, PostTrialsRequestRatingSetRatingInnerEmotion } from "../../schema";
import MediaDisplay from "../../features/MediaDisplay"
import RatingSlider from "../../features/RatingSlider"
import "./MediaRating.css"
import { useLocation, useNavigate } from 'react-router-dom'
import MediaList from "../../../src/imageFileNames.json"

interface RatingPageProps {
    mediaType: string
}

const detasetName = "OASIS";
const experimentLocation = "KC111";
const platform = "";
const rating_second_by_media = 0;
const rateSeconds = 5;
const ratingResult: PostTrialsRequestRatingSetRatingInner[] = [];
const [rateMin, rateDefault, rateMax] = [1, 5, 9];
const mediaNum = 3;

// TODO: mediaTypeに応じて、利用するエンドポイントを切り替える
function RatingPage(props: RatingPageProps) {
    const [mediaSrc, setMediaSrc] = useState('');
    const mediaIndexRef = useRef<number>(0);
    const valenceRef = useRef<number>(rateDefault);
    const arousalRef = useRef<number>(rateDefault);
    const navigate = useNavigate();
    const location = useLocation();
    const subjectMetadata = location.state;
    const [sliderValueTop, setSliderValueTop] = useState(50);
    const [sliderValueBottom, setSliderValueBottom] = useState(50);
    const mediaBaseSrc = "./images/oasis/";
    const [started_at, setStarted_at] = useState("");
    const [ended_at, setEnded_at_at] = useState("");

    const forward = () => {
        if (MediaList !== undefined) { 
            const mediaIndex = mediaIndexRef.current;
            const evaliationMediaFileName = MediaList[mediaIndex];           
            if (evaliationMediaFileName !== undefined) {
                const valence = valenceRef.current;
                const arousal = arousalRef.current;
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
            const doneToRateAllTargets = mediaIndex+1 === mediaNum;
            if (doneToRateAllTargets) {
                setEnded_at_at(new Date().toString())
                const trialMetadata: PostTrialsRequestTrialMetadata = {
                    location: experimentLocation,
                    platform: platform,
                    started_at: started_at,
                    ended_at: ended_at,
                    rating_second_by_media: rating_second_by_media,
                    number_of_medias: mediaNum
                };
                const ratingSet: PostTrialsRequestRatingSet = {
                    media_type: props.mediaType,
                    rating: ratingResult
                };
                const postTrialsRequest: PostTrialsRequest = {
                    trial_metadata: trialMetadata,
                    subject_metadata: subjectMetadata,
                    rating_set: ratingSet
                }
                navigate('/completion', {state: postTrialsRequest});
                return;
            }
            setSliderValueTop(50);
            setSliderValueBottom(50);
            const mediaFileName = MediaList[mediaIndex+1];   
            const mediaSrc = mediaBaseSrc+mediaFileName;
            setMediaSrc(mediaSrc);
            mediaIndexRef.current = mediaIndex + 1;
            valenceRef.current = rateDefault;
            arousalRef.current = rateDefault;
        }
    }

    // TODO: dependenciesにvalence, arousalがあることでバー操作時に更新が止まらない（=カウントのリセットがおこる）
    useEffect(() => {
        const intervalId = setInterval(() => {
            forward();
        }, rateSeconds * 1000);
        return () => {
            clearInterval(intervalId);
        };
    }, []);

    useEffect(() => {
        setStarted_at(new Date().toString());
        MediaList.sort((a, b) => 0.5 - Math.random());
        const mediaIndex = mediaIndexRef.current;
        const mediaFileName = MediaList[mediaIndex];
        const mediaSrc = mediaBaseSrc+mediaFileName;
        setMediaSrc(mediaSrc);
    }, []);
    
    return (
        <Grid
            className='rating_box'
            templateRows='repeat(1, 1fr)'
            templateColumns='repeat(2, 1fr)'
            gap={6}
        >
            <GridItem rowSpan={10} colSpan={2}>
                <MediaDisplay
                    type={props.mediaType}
                    src={mediaSrc}
                />
            </GridItem>

            <GridItem rowSpan={1} colSpan={2} >
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
            </GridItem>
            <GridItem rowSpan={1} colSpan={2} >
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
            </GridItem>
        </Grid>
    );
}

export default RatingPage
