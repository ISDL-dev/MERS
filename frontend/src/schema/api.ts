/* tslint:disable */
/* eslint-disable */
/**
 * MERS API
 * No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
 *
 * The version of the OpenAPI document: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


import type { Configuration } from './configuration';
import type { AxiosPromise, AxiosInstance, AxiosRequestConfig } from 'axios';
import globalAxios from 'axios';
// Some imports not used depending on template conditions
// @ts-ignore
import { DUMMY_BASE_URL, assertParamExists, setApiKeyToObject, setBasicAuthToObject, setBearerAuthToObject, setOAuthToObject, setSearchParams, serializeDataIfNeeded, toPathString, createRequestFunction } from './common';
import type { RequestArgs } from './base';
// @ts-ignore
import { BASE_PATH, COLLECTION_FORMATS, BaseAPI, RequiredError } from './base';

/**
 * 
 * @export
 * @interface ListImagesInner
 */
export interface ListImagesInner {
    /**
     * 
     * @type {number}
     * @memberof ListImagesInner
     */
    'image_id'?: number;
    /**
     * 
     * @type {string}
     * @memberof ListImagesInner
     */
    'google_drive_id'?: string;
}
/**
 * 
 * @export
 * @interface ListMoviesInner
 */
export interface ListMoviesInner {
    /**
     * 
     * @type {number}
     * @memberof ListMoviesInner
     */
    'movie_id'?: number;
    /**
     * 
     * @type {string}
     * @memberof ListMoviesInner
     */
    'google_drive_id'?: string;
}
/**
 * 
 * @export
 * @interface ModelError
 */
export interface ModelError {
    /**
     * 
     * @type {number}
     * @memberof ModelError
     */
    'code': number;
    /**
     * 
     * @type {string}
     * @memberof ModelError
     */
    'message': string;
}
/**
 * 
 * @export
 * @interface PostTrialsRequest
 */
export interface PostTrialsRequest {
    /**
     * 
     * @type {PostTrialsRequestTrialMetadata}
     * @memberof PostTrialsRequest
     */
    'trial_metadata': PostTrialsRequestTrialMetadata;
    /**
     * 
     * @type {PostTrialsRequestSubjectMetadata}
     * @memberof PostTrialsRequest
     */
    'subject_metadata': PostTrialsRequestSubjectMetadata;
    /**
     * 
     * @type {PostTrialsRequestRatingSet}
     * @memberof PostTrialsRequest
     */
    'rating_set': PostTrialsRequestRatingSet;
}
/**
 * 
 * @export
 * @interface PostTrialsRequestRatingSet
 */
export interface PostTrialsRequestRatingSet {
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestRatingSet
     */
    'media_type'?: string;
    /**
     * 
     * @type {Array<PostTrialsRequestRatingSetRatingInner>}
     * @memberof PostTrialsRequestRatingSet
     */
    'rating'?: Array<PostTrialsRequestRatingSetRatingInner>;
}
/**
 * 
 * @export
 * @interface PostTrialsRequestRatingSetRatingInner
 */
export interface PostTrialsRequestRatingSetRatingInner {
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestRatingSetRatingInner
     */
    'dataset'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestRatingSetRatingInner
     */
    'filename'?: string;
    /**
     * 
     * @type {PostTrialsRequestRatingSetRatingInnerEmotion}
     * @memberof PostTrialsRequestRatingSetRatingInner
     */
    'emotion'?: PostTrialsRequestRatingSetRatingInnerEmotion;
}
/**
 * 
 * @export
 * @interface PostTrialsRequestRatingSetRatingInnerEmotion
 */
export interface PostTrialsRequestRatingSetRatingInnerEmotion {
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestRatingSetRatingInnerEmotion
     */
    'valence'?: number;
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestRatingSetRatingInnerEmotion
     */
    'arousal'?: number;
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestRatingSetRatingInnerEmotion
     */
    'liking'?: number;
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestRatingSetRatingInnerEmotion
     */
    'dominance'?: number;
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestRatingSetRatingInnerEmotion
     */
    'famility'?: number;
}
/**
 * 
 * @export
 * @interface PostTrialsRequestSubjectMetadata
 */
export interface PostTrialsRequestSubjectMetadata {
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'id'?: number;
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'age'?: number;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'gender'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'handedness'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'vision'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'vision_aid'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'education'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'alcohol_consumption'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'coffee_consumption'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'tea_consumption'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'tobacco_consumption'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'drug_consumption'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'syndroms'?: string;
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'hours_of_sleep_last_night'?: number;
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'normal_hours_of_sleep'?: number;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'level_of_alertness'?: string;
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'head_circumference'?: number;
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'distance_nasion_inion'?: number;
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestSubjectMetadata
     */
    'distance_left_right_jaw_hinge'?: number;
}
/**
 * 
 * @export
 * @interface PostTrialsRequestTrialMetadata
 */
export interface PostTrialsRequestTrialMetadata {
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestTrialMetadata
     */
    'location'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestTrialMetadata
     */
    'platform'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestTrialMetadata
     */
    'pre_started_at'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestTrialMetadata
     */
    'started_at'?: string;
    /**
     * 
     * @type {string}
     * @memberof PostTrialsRequestTrialMetadata
     */
    'ended_at'?: string;
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestTrialMetadata
     */
    'rating_second_by_media'?: number;
    /**
     * 
     * @type {number}
     * @memberof PostTrialsRequestTrialMetadata
     */
    'number_of_medias'?: number;
}

/**
 * TrialsApi - axios parameter creator
 * @export
 */
export const TrialsApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * create a trial result containing a set of a subject info and rating results
         * @summary create a trial result
         * @param {PostTrialsRequest} [postTrialsRequest] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        postTrials: async (postTrialsRequest?: PostTrialsRequest, options: AxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/trials`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(postTrialsRequest, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * TrialsApi - functional programming interface
 * @export
 */
export const TrialsApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = TrialsApiAxiosParamCreator(configuration)
    return {
        /**
         * create a trial result containing a set of a subject info and rating results
         * @summary create a trial result
         * @param {PostTrialsRequest} [postTrialsRequest] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async postTrials(postTrialsRequest?: PostTrialsRequest, options?: AxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<void>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.postTrials(postTrialsRequest, options);
            return createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration);
        },
    }
};

/**
 * TrialsApi - factory interface
 * @export
 */
export const TrialsApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = TrialsApiFp(configuration)
    return {
        /**
         * create a trial result containing a set of a subject info and rating results
         * @summary create a trial result
         * @param {PostTrialsRequest} [postTrialsRequest] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        postTrials(postTrialsRequest?: PostTrialsRequest, options?: any): AxiosPromise<void> {
            return localVarFp.postTrials(postTrialsRequest, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * TrialsApi - object-oriented interface
 * @export
 * @class TrialsApi
 * @extends {BaseAPI}
 */
export class TrialsApi extends BaseAPI {
    /**
     * create a trial result containing a set of a subject info and rating results
     * @summary create a trial result
     * @param {PostTrialsRequest} [postTrialsRequest] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof TrialsApi
     */
    public postTrials(postTrialsRequest?: PostTrialsRequest, options?: AxiosRequestConfig) {
        return TrialsApiFp(this.configuration).postTrials(postTrialsRequest, options).then((request) => request(this.axios, this.basePath));
    }
}


