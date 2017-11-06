import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    console.log(this.props.pokemon);
    this.props.requestAllPokemon();
  }

  render() {
    const {pokemon} = this.props;
    return (
    <div>
        hello
      <ul>
        {
          this.props.pokemon.map((poke) => <PokemonIndexItem pokemon={poke} />)
        }
      </ul>
    </div>
    );
  }
}





export default PokemonIndex;
