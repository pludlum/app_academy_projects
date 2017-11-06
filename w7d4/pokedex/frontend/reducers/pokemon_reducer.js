import merge from 'lodash/merge';
import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from '../actions/pokemon_actions';

export const pokemonReducer = (state = {}, action) => {
  let newState = {};
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      newState = merge({}, state, action.pokemon);
      return newState;
    case RECEIVE_POKEMON:
      newState[action.poke.pokemon.id] = action.poke.pokemon;
      let returnState = merge({}, state, newState);
      return returnState;
    default:
      return state;
  }
};
