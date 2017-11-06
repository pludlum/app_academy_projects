import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import {Route} from "react-router-dom";

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    // console.log(this.props.pokemon);
    this.props.requestAllPokemon();
  }

  render() {
    const {pokemon} = this.props;
    return (
    <div className="pokeApp">
      <ul className="pokeIndex">
        {
          this.props.pokemon.map((poke) => <PokemonIndexItem key={"pokemon-" + poke.id} pokemon={poke} />)
        }
      </ul>
      <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
    </div>
    );
  }
}





export default PokemonIndex;
