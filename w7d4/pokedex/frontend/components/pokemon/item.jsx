import React from 'react';
import { Link } from 'react-router-dom';

class Item extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {

    const item = this.props.items[parseInt(this.props.id)];

    return (
      <li>
        <Link to={`/pokemon/${item.pokemon_id}/items/${item.id}`}>
          <img src={item.image_url} height="50px" width="50px"></img>
        </Link>
      </li>
    );
  }
}

export default Item;
