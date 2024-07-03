import axios from 'axios';
import { TrialsApi, RecordingStartApi, RecordingPauseApi } from './schema';

const baseURL = process.env.REACT_APP_BACKEND_ENDPOINT

const api = axios.create({
  baseURL: baseURL
});

const trialsApi = new TrialsApi(undefined, baseURL, api)
const recordingStartApi = new RecordingStartApi(undefined, baseURL, api)
const recordingPauseApi = new RecordingPauseApi(undefined, baseURL, api)

export {
  trialsApi,
  recordingStartApi,
  recordingPauseApi
}