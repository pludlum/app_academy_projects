import React from 'react';

class PokemonIndexItem extends React.Component {
  constructor (props) {
    super(props);
  }

  render() {
    return (
      <li>
        {this.props.pokemon.name}
        <img src={this.props.pokemon.image_url}/>
      </li>
    );
  }
}

export default PokemonIndexItem;
