import { useState } from 'react'
import {
    Slider,
    SliderTrack,
    SliderFilledTrack,
    SliderThumb,
    SliderMark,
    Tooltip
} from '@chakra-ui/react'

interface RatingSliderProps {
  rateValueRef: React.MutableRefObject<number>
  sliderValue: number
  setSliderValue: Function
  min: number
  max: number
  label: string
  minLabel: string
  maxLabel: string
}

function RatingSlider(props: RatingSliderProps) {
    const [showTooltip, setShowTooltip] = useState(false)
    return (
      <>
      <p>{props.label}</p>
      <Slider
        id='slider'
        size="lg"
        defaultValue={50}
        min={0}
        max={100}
        colorScheme='teal'
        value={props.sliderValue}
        onChange={
          (v) => {
            props.setSliderValue(v);
            const lenScale = props.max - props.min;
            let ratedVar = lenScale * v / 100;
            props.rateValueRef.current = ratedVar;
          }
        }
        onMouseEnter={() => setShowTooltip(true)}
        onMouseLeave={() => setShowTooltip(false)}
      >
        <SliderMark value={0} mt='1' ml='4' fontSize='md'>
          {props.minLabel}
        </SliderMark>
        <SliderMark value={50} mt='1' ml='-2.5' fontSize='md'>
          50%
        </SliderMark>
        <SliderMark value={100} mt='1' ml='-20' fontSize='md'>
          {props.maxLabel}
        </SliderMark>
        <SliderTrack>
          <SliderFilledTrack />
        </SliderTrack>
        <Tooltip
          hasArrow
          bg='teal.500'
          color='white'
          placement='top'
          isOpen={showTooltip}
          label={`${props.sliderValue}%`}
        >
          <SliderThumb />
        </Tooltip>
      </Slider>
      </>
      
    )
}

export default RatingSlider
