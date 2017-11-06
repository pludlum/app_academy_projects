import merge from 'lodash/merge';
import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from '../actions/pokemon_actions';
import values from 'lodash/values';

const itemsReducer = (state = {}, action) => {
  let newState ={};
  switch(action.type) {
    case RECEIVE_POKEMON:
      let itemObjs = values(action.poke.items);
      const goodKeys = {};

      itemObjs.forEach( (obj) => {
        goodKeys[obj.id] = obj;
      });

      newState = merge({}, state, goodKeys);
      return newState;
    default:
      return state;
  }
};

export default itemsReducer;
