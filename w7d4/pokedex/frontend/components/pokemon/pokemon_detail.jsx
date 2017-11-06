import React from 'react';
import {Route} from 'react-router-dom';
import ItemDetailContainer from './item_detail_container';
import Item from './item';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestPokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps (newprops) {
    if (this.props.match.params.pokemonId !== newprops.match.params.pokemonId) {
      this.props.requestPokemon(newprops.match.params.pokemonId);
    }
  }

  render() {



    if (this.props.pokemon) {


      return (
        <div className="pokeContainer">
          <img src={this.props.pokemon.image_url}></img>
          <h4>{this.props.pokemon.name}</h4>
          <ul>
            <li>Type: {this.props.pokemon.type}</li>
            <li>Attack: {this.props.pokemon.attack}</li>
            <li>Defense: {this.props.pokemon.defense}</li>
            <li>Moves: {this.props.pokemon.moves.join(', ')}</li>
          </ul>
          <ul className="itemImages">
            {
              this.props.pokemon.items.map( (itemId) => <Item items={this.props.items} id={itemId}/>)
            }
          </ul>
          <Route path="/pokemon/:pokemonId/items/:itemId" component={ItemDetailContainer} />
        </div>
      );
    } else {
      return (
        <div></div>
      );
    }

  }
}

export default PokemonDetail;
