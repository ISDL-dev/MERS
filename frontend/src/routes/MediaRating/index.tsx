import { Grid, GridItem } from '@chakra-ui/react'
import { useEffect, useRef, useState } from 'react'
import api from '../../api';

import MediaDisplay from "../../features/MediaDisplay"
import RatingSlider from "../../features/RatingSlider"
import { ListImagesInner } from '../../schema'
import "./MediaRating.css"
import { useLocation, useNavigate } from 'react-router-dom'

interface MediaRate {
    mediaID: number
    valence: number
    arousal: number
}

interface RatingPageProps {
    mediaType: string
}

const rateSeconds = 5;
const ratingResult: MediaRate[] = [];
const [rateMin, rateDefault, rateMax] = [1, 5, 9];
const mediaNum = 3;

// TODO: mediaTypeに応じて、利用するエンドポイントを切り替える
function RatingPage(props: RatingPageProps) {
    const [currentMediaIndex, setCurrentMediaIndex] = useState(0);
    const [mediaSrc, setMediaSrc] = useState('');
    const listImages = useRef<ListImagesInner[]>();
    const forward = () => {
        if (listImages.current !== undefined) {
            const mediaID = listImages.current[currentMediaIndex].image_id;
            if (mediaID !== undefined) {
                const mediaRate: MediaRate = {mediaID, valence, arousal};
                ratingResult.push(mediaRate);
                console.log(ratingResult);
            }
            const doneToRateAllTargets = currentMediaIndex+1 === mediaNum;
            if (doneToRateAllTargets) {
                navigate('/completion', {state: {'subject':subject, 'rating_result':ratingResult}});
                return;
            }

            const googleDriveID = listImages.current[currentMediaIndex+1].google_drive_id;
            const mediaSrc = 'http://drive.google.com/uc?export=view&id='+googleDriveID;
            setMediaSrc(mediaSrc);

            setSliderValueTop(50);
            setSliderValueBottom(50);
            setCurrentMediaIndex(currentMediaIndex+1);
        }
    }

    const navigate = useNavigate();
    const location = useLocation();
    const subject = location.state;
    const [sliderValueTop, setSliderValueTop] = useState(50);
    const [sliderValueBottom, setSliderValueBottom] = useState(50);
    const [valence, setValence] = useState(rateDefault);
    const [arousal, setArousal] = useState(rateDefault);

    useEffect(() => {
        const intervalId = setInterval(() => {
            forward();
        }, rateSeconds * 1000);
        return () => {
            clearInterval(intervalId);
        };
    }, [currentMediaIndex, valence, arousal]);

    useEffect(() => {
        // TODO: リクエスト時のエラーハンドリング（現状、listImagesが空になって実行時エラーが発生する）
        api.get('/images')
        .then(response => {
            if(response.status === 200) {
                listImages.current = response.data;
            }
        })
        .catch(e => {
            listImages.current = [
                {'image_id': 1, 'google_drive_id': '1poxG2B3hkrQ0g6Y8mJAaUtVFLtGfsIc6'},
                {'image_id': 2, 'google_drive_id': '1AkGM7sgDIeL_54n43XpeC8OmhJvhl9Ym'},
                {'image_id': 3, 'google_drive_id': '1pmJq300SwE6AIUOmJwqZ5VsWrxKh0XgC'},
            ];
            const googleDriveID = listImages.current[currentMediaIndex].google_drive_id;
            const mediaSrc = 'http://drive.google.com/uc?export=view&id='+googleDriveID;
            setMediaSrc(mediaSrc);
            console.log(e);
        })
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
                    setRateValue={setValence}
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
                    setRateValue={setArousal}
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
