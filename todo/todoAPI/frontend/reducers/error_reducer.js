import {RECEIVE_ERRORS, CLEAR_ERRORS} from '../actions/error_actions';

const errorReducer = (errorState = [], action) => {
  switch (action.type) {
    case RECEIVE_ERRORS:
      const newState = [];
      newState.push(action.errors);
      return newState;

    case CLEAR_ERRORS: {
      const emptyState = [];
      return emptyState;
    }
    default:
      return errorState;
  }
};

export default errorReducer;
