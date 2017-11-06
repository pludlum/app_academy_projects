
import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Weather from './frontend/weather';

class Root extends React.Component {
    constructor() {
      super();

    }

    render() {
      return(
        <div>
          <Clock />
          <Weather />
        </div>
      );
    }
}

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    ReactDOM.render(<Root/>, root);
});
