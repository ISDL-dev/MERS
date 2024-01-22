import axios from 'axios';
import { TrialsApi, ImagesApi, RecordingStartApi, RecordingPauseApi } from './schema';

const baseURL = 'http://localhost:3000'

const api = axios.create({
  baseURL: baseURL
});

const trialsApi = new TrialsApi(undefined, baseURL, api)
const imagesApi = new ImagesApi(undefined, baseURL, api)
const recordingStartApi = new RecordingStartApi(undefined, baseURL, api)
const recordingPauseApi = new RecordingPauseApi(undefined, baseURL, api)

export {
  trialsApi,
  imagesApi,
  recordingStartApi,
  recordingPauseApi
}