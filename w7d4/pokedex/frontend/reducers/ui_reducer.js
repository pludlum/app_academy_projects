import merge from 'lodash/merge';
import { RECEIVE_POKEMON } from '../actions/pokemon_actions';

const uiReducer = (state = {}, action) => {

  switch(action.type) {
    case RECEIVE_POKEMON:
    let newState = {
      pokeDisplay: 0,
      errors: {},
      loading: {}
    };
    console.log(action.poke);
    newState['pokeDisplay'] = action.poke.pokemon.id;
      return newState;
    default:
      return state;
  }
};

export default uiReducer;
