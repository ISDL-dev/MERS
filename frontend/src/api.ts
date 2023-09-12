import axios from 'axios';
import { TrialsApi, ImagesApi } from './schema';

const api = axios.create({
  baseURL: 'http://localhost:3000'
});

const trialsApi = new TrialsApi(undefined, 'http://localhost:3000', api)
const imagesApi = new ImagesApi(undefined, 'http://localhost:3000', api)

export {
  trialsApi,
  imagesApi
}