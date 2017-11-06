import * as APIUtil from '../util/api_util.js';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

export const receiveCurrentUser = (sessionInfo) => ({
  type: RECEIVE_CURRENT_USER,
  sessionInfo
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});
