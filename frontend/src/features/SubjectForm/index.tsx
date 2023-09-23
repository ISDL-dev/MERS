import React from 'react'
import { 
    Input, Text, Stack,
    NumberInput, NumberInputField, NumberInputStepper, NumberIncrementStepper, NumberDecrementStepper,
    RadioGroup, Radio
} from '@chakra-ui/react'

import "./SubjectForm.css"

class MyPostTrialsRequestSubject {
    setAge: (newAge: number) => void
    setGender: (newGender: string) => void
    setHandedness: (newHandedness: string) => void
    setVision: (newVision: string) => void
    setVisionAid: (newVisionAid: string) => void
    setEducation: (newEducation: string) => void
    setAlcoholConsumption: (newAlcoholConsumption: string) => void
    setCoffeeConsumption: (newCoffeeConsumption: string) => void
    setTeaConsumption: (newTeaConsumption: string) => void
    setTobaccoConsumption: (newTobaccoConsumption: string) => void
    setDrugConsumption: (newDrugConsumption: string) => void
    setSyndroms: (newSyndroms: string) => void
    setHoursOfSleepLastNight: (newHoursOfSleepLastNight: number) => void
    setNormalHoursOfSleep: (newNormalHoursOfSleep: number) => void
    setLevelOfAlertness: (newLevelOfAlertness: string) => void
    setDistributePhysiologicalRecordings: (newDistributePhysiologicalRecordings: boolean) => void
    setPublishAudioVisualRecordings: (newPublishAudioVisualRecordings: boolean) => void
    setHeadCircumference: (newHeadCircumference: number) => void
    setDistanceNasionInion: (newDistanceNasionInion: number) => void
    setDistanceLeftRightJawHinge: (newDistanceLeftRightJawHinge: number) => void

    constructor(
        setAge: (newAge: number) => void,
        setGender: (newGender: string) => void,
        setHandedness: (newHandedness: string) => void,
        setVision: (newVision: string) => void,
        setVisionAid: (newVisionAid: string) => void,
        setEducation: (newEducation: string) => void,
        setAlcoholConsumption: (newAlcoholConsumption: string) => void,
        setCoffeeConsumption: (newCoffeeConsumption: string) => void,
        setTeaConsumption: (newTeaConsumption: string) => void,
        setTobaccoConsumption: (newTobaccoConsumption: string) => void,
        setDrugConsumption: (newDrugConsumption: string) => void,
        setSyndroms: (newSyndroms: string) => void,
        setHoursOfSleepLastNight: (newHoursOfSleepLastNight: number) => void,
        setNormalHoursOfSleep: (newNormalHoursOfSleep: number) => void,
        setLevelOfAlertness: (newLevelOfAlertness: string) => void,
        setDistributePhysiologicalRecordings: (newDistributePhysiologicalRecordings: boolean) => void,
        setPublishAudioVisualRecordings: (newPublishAudioVisualRecordings: boolean) => void,
        setHeadCircumference: (newHeadCircumference: number) => void,
        setDistanceNasionInion: (newDistanceNasionInion: number) => void,
        setDistanceLeftRightJawHinge: (newDistanceLeftRightJawHinge: number) => void
    ) {
        this.setAge = setAge
        this.setGender = setGender
        this.setHandedness = setHandedness
        this.setVision = setVision
        this.setVisionAid = setVisionAid
        this.setEducation = setEducation
        this.setAlcoholConsumption = setAlcoholConsumption
        this.setCoffeeConsumption = setCoffeeConsumption
        this.setTeaConsumption = setTeaConsumption
        this.setTobaccoConsumption = setTobaccoConsumption
        this.setDrugConsumption = setDrugConsumption
        this.setSyndroms = setSyndroms
        this.setHoursOfSleepLastNight = setHoursOfSleepLastNight
        this.setNormalHoursOfSleep = setNormalHoursOfSleep
        this.setLevelOfAlertness = setLevelOfAlertness
        this.setDistributePhysiologicalRecordings = setDistributePhysiologicalRecordings
        this.setPublishAudioVisualRecordings = setPublishAudioVisualRecordings
        this.setHeadCircumference = setHeadCircumference
        this.setDistanceNasionInion = setDistanceNasionInion
        this.setDistanceLeftRightJawHinge = setDistanceLeftRightJawHinge
    }
}

function SubjectForm(props: MyPostTrialsRequestSubject) {
    const onChangeAge = (valueAsString: string, valueAsNumber: number):void => props.setAge(valueAsNumber)
    const onChangeGender = (nextValue: string):void => props.setGender(nextValue)
    const onChangeHandedness = (nextValue: string):void => props.setHandedness(nextValue)
    const onChangeVision = (nextValue: string):void => props.setVision(nextValue)
    const onChangeVisionAid = (nextValue: string):void => props.setVisionAid(nextValue)
    const onChangeEducation = (nextValue: string):void => props.setEducation(nextValue)
    const onChangeAlcoholConsumption = (nextValue: string):void => props.setAlcoholConsumption(nextValue)
    const onChangeCoffeeConsumption = (nextValue: string):void => props.setCoffeeConsumption(nextValue)
    const onChangeTeaConsumption = (nextValue: string):void => props.setTeaConsumption(nextValue)
    const onChangeTobaccoConsumption = (nextValue: string):void => props.setTobaccoConsumption(nextValue)
    const onChangeDrugConsumption = (event: React.ChangeEvent<HTMLInputElement>):void => props.setDrugConsumption(event.target.value)
    const onChangeSyndroms = (event: React.ChangeEvent<HTMLInputElement>):void => props.setSyndroms(event.target.value)
    const onChangeHoursOfSleepLastNight = (valueAsString: string, valueAsNumber: number):void => props.setAge(valueAsNumber)
    const onChangeNormalHoursOfSleep = (valueAsString: string, valueAsNumber: number):void => props.setAge(valueAsNumber)
    const onChangeLevelOfAlertness = (nextValue: string):void => props.setLevelOfAlertness(nextValue)
    const onChangeDistributePhysiologicalRecordings = (valueAsString: string, valueAsNumber: number):void => props.setAge(valueAsNumber)
    const onChangePublishAudioVisualRecordings = (valueAsString: string, valueAsNumber: number):void => props.setAge(valueAsNumber)
    const onChangeHeadCircumference = (valueAsString: string, valueAsNumber: number):void => props.setAge(valueAsNumber)
    const onChangeDistanceLeftRightJawHinge = (valueAsString: string, valueAsNumber: number):void => props.setAge(valueAsNumber)

    return (
        <div className='form'>
        
        <div className='item'>
            <Text fontSize={"medium"}>あなたの年齢を入力してください。</Text>
            <NumberInput onChange={onChangeAge} defaultValue={20} min={18} max={100} >
                <NumberInputField />
                <NumberInputStepper>
                    <NumberIncrementStepper />
                    <NumberDecrementStepper />
                </NumberInputStepper>
            </NumberInput>
        </div>

        <div className='item'>
            <Text fontSize={"medium"}>あなたの性別を入力してください。</Text>
            <RadioGroup defaultValue='men' onChange={onChangeGender}>
                <Stack spacing={5} direction='row'>
                    <Radio colorScheme='green' value='men'>
                    男性
                    </Radio>
                    <Radio colorScheme='green' value='women'>
                    女性
                    </Radio>
                    <Radio colorScheme='green' value='none'>
                    回答しない
                    </Radio>
                </Stack>
            </RadioGroup>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>あなたの学歴を教えてください。</Text>
        <RadioGroup defaultValue='high_school' onChange={onChangeEducation}>
            <Stack spacing={5} direction='row'>
                <Radio colorScheme='green' value='high_school'>
                高卒
                </Radio>
                <Radio colorScheme='green' value='bachelor'>
                大卒
                </Radio>
                <Radio colorScheme='green' value='master'>
                院卒
                </Radio>
            </Stack>
        </RadioGroup>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>あなたの利き手を入力してください。</Text>
        <RadioGroup defaultValue='left_handed' onChange={onChangeHandedness}>
            <Stack spacing={5} direction='row'>
                <Radio colorScheme='green' value='left_handed'>
                左手
                </Radio>
                <Radio colorScheme='green' value='right_handed'>
                右手
                </Radio>
            </Stack>
        </RadioGroup>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>あなたの利き目を入力してください。</Text>
        <RadioGroup defaultValue='left_eye' onChange={onChangeVision}>
            <Stack spacing={5} direction='row'>
                <Radio colorScheme='green' value='left_eye'>
                左目
                </Radio>
                <Radio colorScheme='green' value='right_eye'>
                右目
                </Radio>
            </Stack>
        </RadioGroup>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>視力補助について入力してください。</Text>
        <RadioGroup defaultValue='unaided' onChange={onChangeVisionAid}>
            <Stack spacing={5} direction='row'>
                <Radio colorScheme='green' value='unaided'>
                裸眼
                </Radio>
                <Radio colorScheme='green' value='glasses'>
                メガネ
                </Radio>
                <Radio colorScheme='green' value='contact_lenses'>
                コンタクト
                </Radio>
            </Stack>
        </RadioGroup>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>飲酒習慣について入力してください。</Text>
        <RadioGroup defaultValue='regularly' onChange={onChangeAlcoholConsumption}>
            <Stack spacing={5} direction='row'>
                <Radio colorScheme='green' value='regularly'>
                習慣的に飲む
                </Radio>
                <Radio colorScheme='green' value='yesterday'>
                昨日飲んだ
                </Radio>
                <Radio colorScheme='green' value='never'>
                全く飲まない
                </Radio>
            </Stack>
        </RadioGroup>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>カフェイン摂取について入力してください。</Text>
        <RadioGroup defaultValue='regularly' onChange={onChangeCoffeeConsumption}>
            <Stack spacing={5} direction='row'>
                <Radio colorScheme='green' value='regularly'>
                習慣的に飲む
                </Radio>
                <Radio colorScheme='green' value='yesterday'>
                昨日飲んだ
                </Radio>
                <Radio colorScheme='green' value='never'>
                全く飲まない
                </Radio>
            </Stack>
        </RadioGroup>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>習慣的にお茶を飲みますか？</Text>
        <RadioGroup defaultValue='regularly' onChange={onChangeTeaConsumption}>
            <Stack spacing={5} direction='row'>
                <Radio colorScheme='green' value='regularly'>
                習慣的に飲む
                </Radio>
                <Radio colorScheme='green' value='yesterday'>
                昨日飲んだ
                </Radio>
                <Radio colorScheme='green' value='never'>
                全く飲まない
                </Radio>
            </Stack>
        </RadioGroup>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>喫煙週間について入力してください。</Text>
        <RadioGroup defaultValue='regularly' onChange={onChangeTobaccoConsumption}>
            <Stack spacing={5} direction='row'>
                <Radio colorScheme='green' value='regularly'>
                習慣的に飲む
                </Radio>
                <Radio colorScheme='green' value='yesterday'>
                昨日飲んだ
                </Radio>
                <Radio colorScheme='green' value='never'>
                全く飲まない
                </Radio>
            </Stack>
        </RadioGroup>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>服用物について入力してください。</Text>
        <Input color='black' onChange={onChangeDrugConsumption}/>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>注意力や神経、身体に関する症状があれば入力してください。</Text>
        <Input color='black' onChange={onChangeSyndroms}/>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>今日の睡眠時間を入力してください。</Text>
        <NumberInput defaultValue={7} min={0} max={24} onChange={onChangeHoursOfSleepLastNight}
        >
        <NumberInputField />
        <NumberInputStepper>
            <NumberIncrementStepper />
            <NumberDecrementStepper />
        </NumberInputStepper>
        </NumberInput>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>普段の睡眠時間を入力してください。</Text>
        <NumberInput defaultValue={7} min={0} max={24} onChange={onChangeNormalHoursOfSleep}>
        <NumberInputField />
        <NumberInputStepper>
            <NumberIncrementStepper />
            <NumberDecrementStepper />
        </NumberInputStepper>
        </NumberInput>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>今日の眠気を入力してください。</Text>
        <RadioGroup defaultValue='never' onChange={onChangeLevelOfAlertness}>
            <Stack spacing={5} direction='row'>
                <Radio colorScheme='green' value='never'>
                眠気が一切ない
                </Radio>
                <Radio colorScheme='green' value='normal'>
                普通
                </Radio>
                <Radio colorScheme='green' value='sleepy'>
                眠い
                </Radio>
            </Stack>
        </RadioGroup>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>上から測った頭部の長さを入力してください。</Text>
        <NumberInput defaultValue={15} min={10} max={30} onChange={onChangeHeadCircumference}>
        <NumberInputField />
        <NumberInputStepper>
            <NumberIncrementStepper />
            <NumberDecrementStepper />
        </NumberInputStepper>
        </NumberInput>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>横から測った頭部の長さを入力してください。</Text>
        <NumberInput defaultValue={15} min={10} max={30}>
        <NumberInputField />
        <NumberInputStepper>
            <NumberIncrementStepper />
            <NumberDecrementStepper />
        </NumberInputStepper>
        </NumberInput>
        </div>

        <div className='item'>
        <Text fontSize={"medium"}>顎の長さを入力してください。</Text>
        <NumberInput defaultValue={15} min={10} max={30} onChange={onChangeDistanceLeftRightJawHinge}>
        <NumberInputField />
        <NumberInputStepper>
            <NumberIncrementStepper />
            <NumberDecrementStepper />
        </NumberInputStepper>
        </NumberInput>
        </div>
        
        </div>
    )
}

export default SubjectForm
