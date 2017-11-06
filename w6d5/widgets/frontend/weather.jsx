import React from 'react';

class Weather extends React.Component {
  constructor() {
    super();
    this.state = {
      weatherInfo: null,
    };

  }

  getWeather(position) {
    let request = new XMLHttpRequest();
    let apiKey = "7a944876c5d26402cef1cb2109c9ec2b";
    request.open('GET', `http://api.openweathermap.org/data/2.5/weather?lat=${position.coords.latitude}&lon=${position.coords.longitude}&APPID=${apiKey}`, true);

    request.onload = function() {
      if (request.status === 200) {
        console.log(request.responseText);
        const data = JSON.parse(request.responseText);
        this.setState({weatherInfo: data});
      } else {
        console.log("Failed request");
      }
    };

    request.send();
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition(this.getWeather.bind(this));

  }

  render() {
    return (
      <div>
        <h1>CURRENT CITY</h1>
        <p> {this.state.weatherInfo} </p>
      </div>
    );
  }
}

export default Weather;
