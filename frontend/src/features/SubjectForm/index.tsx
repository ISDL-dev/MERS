import React from 'react'
import { 
    Input, Text, Stack,
    NumberInput, NumberInputField, NumberInputStepper, NumberIncrementStepper, NumberDecrementStepper,
    RadioGroup, Radio
} from '@chakra-ui/react'

import "./SubjectForm.css"
import { PostTrialsRequestSubject } from '../../schema'

class MyPostTrialsRequestSubject implements PostTrialsRequestSubject {
    age: number;
    setAge: (newAge: number) => void
    gender: string;
    setGender: (newGender: string) => void
    handedness: string;
    setHandedness: (newHandedness: string) => void
    visionAid: string;
    setVisionAid: (newVisionAid: string) => void
    education: string;
    setEducation: (newEducation: string) => void
    alcoholConsumption: string;
    setAlcoholConsumption: (newAlcoholConsumption: string) => void
    coffeeConsumption: string;
    setCoffeeConsumption: (newCoffeeConsumption: string) => void
    teaConsumption: string;
    setTeaConsumption: (newTeaConsumption: string) => void
    tobaccoConsumption: string;
    setTobaccoConsumption: (newTobaccoConsumption: string) => void
    drugConsumption: string;
    setDrugConsumption: (newDrugConsumption: string) => void
    syndroms: string;
    setSyndroms: (newSyndroms: string) => void
    hoursOfSleepLastNight: number;
    setHoursOfSleepLastNight: (newHoursOfSleepLastNight: number) => void
    normalHoursOfSleep: number;
    setNormalHoursOfSleep: (newNormalHoursOfSleep: number) => void
    levelOfAlertness: string;
    setLevelOfAlertness: (newLevelOfAlertness: string) => void
    distributePhysiologicalRecordings: boolean;
    setDistributePhysiologicalRecordings: (newDistributePhysiologicalRecordings: boolean) => void
    publishAudioVisualRecordings: boolean;
    setPublishAudioVisualRecordings: (newPublishAudioVisualRecordings: boolean) => void
    headCircumference: number;
    setHeadCircumference: (newHeadCircumference: number) => void
    distanceNasionInion: number;
    setDistanceNasionInion: (newDistanceNasionInion: number) => void
    distanceLeftRightJawHinge: number;
    setDistanceLeftRightJawHinge: (newDistanceLeftRightJawHinge: number) => void

    constructor(
        age: number,
        gender: string,
        handedness: string,
        visionAid: string,
        educaton: string,
        alcoholConsumption: string,
        coffeeConsumption: string,
        teaConsumption: string,
        tobaccoConsumption: string,
        drugConsumption: string,
        syndroms: string,
        hoursOfSleepLastNight: number,
        normalHoursOfSleep: number,
        levelOfAlertness: string,
        distributePhysiologicalRecordings: boolean,
        publishAudioVisualRecordings: boolean,
        headCircumference: number,
        distance_nasion_inion: number,
        distanceLeftRightJawHinge: number
    ) {
        this.age = age
        this.setAge = (newAge) => {this.age = newAge}
        this.gender = gender
        this.setGender =(newGender) => {this.gender = newGender}
        this.handedness = handedness
        this.setHandedness = (newHandedness) => {this.handedness = newHandedness}
        this.visionAid = visionAid
        this.setVisionAid = (newVisionAid) => {this.visionAid = newVisionAid}
        this.education = educaton
        this.setEducation = (newEducation) => {this.education = newEducation}
        this.alcoholConsumption = alcoholConsumption
        this.setAlcoholConsumption = (newAlcoholConsumption) => {this.alcoholConsumption = newAlcoholConsumption}
        this.coffeeConsumption = coffeeConsumption
        this.setCoffeeConsumption = (newCoffeeConsumption) => {this.coffeeConsumption = newCoffeeConsumption}
        this.teaConsumption = teaConsumption
        this.setTeaConsumption = (newTeaConsumption) => {this.teaConsumption = newTeaConsumption}
        this.tobaccoConsumption = tobaccoConsumption
        this.setTobaccoConsumption = (newTobaccoConsumption) => {this.tobaccoConsumption = newTobaccoConsumption}
        this.drugConsumption = drugConsumption
        this.setDrugConsumption = (newDrugConsumption) => {this.drugConsumption = newDrugConsumption}
        this.syndroms = syndroms
        this.setSyndroms = (newSyndroms) => {this.syndroms = newSyndroms}
        this.hoursOfSleepLastNight = hoursOfSleepLastNight
        this.setHoursOfSleepLastNight = (newHoursOfSleepLastNight) => {this.hoursOfSleepLastNight = newHoursOfSleepLastNight}
        this.normalHoursOfSleep = normalHoursOfSleep
        this.setNormalHoursOfSleep = (newNormalHoursOfSleep) => {this.normalHoursOfSleep = newNormalHoursOfSleep}
        this.levelOfAlertness = levelOfAlertness
        this.setLevelOfAlertness = (newLevelOfAlertness) => {this.levelOfAlertness = newLevelOfAlertness}
        this.distributePhysiologicalRecordings = distributePhysiologicalRecordings
        this.setDistributePhysiologicalRecordings = (newDistributePhysiologicalRecordings) => {this.distributePhysiologicalRecordings = newDistributePhysiologicalRecordings}
        this.publishAudioVisualRecordings = publishAudioVisualRecordings
        this.setPublishAudioVisualRecordings = (newPublishAudioVisualRecordings) => {this.publishAudioVisualRecordings = newPublishAudioVisualRecordings}
        this.headCircumference = headCircumference
        this.setHeadCircumference = (newHeadCircumference) => {this.headCircumference = newHeadCircumference}
        this.distanceNasionInion = distance_nasion_inion
        this.setDistanceNasionInion = (newDistanceNasionInion) => {this.distanceNasionInion = newDistanceNasionInion}
        this.distanceLeftRightJawHinge = distanceLeftRightJawHinge
        this.setDistanceLeftRightJawHinge = (newDistanceLeftRightJawHinge) => {this.distanceLeftRightJawHinge = newDistanceLeftRightJawHinge}
    }
}

function SubjectForm(props: MyPostTrialsRequestSubject) {
    const onChangeAge = (valueAsString: string, valueAsNumber: number):void => props.setAge(valueAsNumber)
    const onChangeGender = (nextValue: string):void => props.setGender(nextValue)
    const onChangeHandedness = (nextValue: string):void => props.setHandedness(nextValue)
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
