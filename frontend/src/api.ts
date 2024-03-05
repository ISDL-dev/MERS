import axios from 'axios';
import { TrialsApi } from './schema';

const BASEURL = process.env.BACKEND_ENDPOINT
const api = axios.create({
  baseURL: BASEURL
});

const trialsApi = new TrialsApi(undefined, BASEURL, api)

export {
  trialsApi
}