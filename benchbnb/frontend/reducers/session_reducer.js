import {RECEIVE_CURRENT_USER} from '../actions/session_actions';
import merge from 'lodash/merge';


const _nullState = {
  currentUser: null
};

const SessionReducer = (state = _nullState, action) => {
  Object.freeze(state);
  switch(action.type) {

    case RECEIVE_CURRENT_USER:
      const newState = action.sessionInfo;
      return merge({}, state, newState);

    default:
      return state;
  }
};

export default SessionReducer;
