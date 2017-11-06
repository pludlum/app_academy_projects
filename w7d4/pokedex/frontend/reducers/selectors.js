import values from 'lodash/values';

export const selectAllPokemon = (state) => {

  return values(state.entities.pokemon);
};

export const selectPokemonItem = (state, itemId) => {
  return state.entities.items[itemId];
};
