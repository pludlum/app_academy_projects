export const fetchAllPokemon = () => (
  $.ajax({
    method: "get",
    url: 'api/pokemon'
  })
);

export const catchPokemon = (pokemonId) => (
  $.ajax({
    method: "get",
    url: `api/pokemon/${pokemonId}`
  })
);
