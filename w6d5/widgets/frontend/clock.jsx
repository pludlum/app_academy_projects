import React from 'react';

 class Clock extends React.Component {
   constructor() {
     super();
     this.state = {
       time : new Date()
     };

     this.clockInterval = "?";
    //  this.tick = this.tick.bind(this);
   }

   componentDidMount() {
     this.clockInterval = setInterval(this.tick.bind(this), 1000);

   }

   componentWillUnmount() {
     clearInterval(this.clockInterval);

   }

   tick() {
     this.setState({ time : new Date()});
   }

   render() {
     return (
       <div>
         <h1 className='clock'> CODING TIME: </h1>
          <div className='clock'>
           {this.state.time.getHours()} :: {this.state.time.getMinutes()} :: {this.state.time.getSeconds()}
          </div>
      </div>
     );
   }
}




export default Clock;
