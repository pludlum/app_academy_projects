import merge from 'lodash/merge';
import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';

export const pokemonReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      let newState = {};
      newState = merge({}, state, action.pokemon);
      return newState;
    default:
      return state;
  }
};
