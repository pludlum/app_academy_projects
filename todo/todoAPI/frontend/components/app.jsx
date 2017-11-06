import React from 'react';
import TodoListContainer from './todo_list/todo_list_container';

class App extends React.Component {
  constructor() {
    super();
  }
  render() {
    return (
      <div>
        <h1>To do list</h1>
        <TodoListContainer/>
    </div>
    );
  }
}


export default App;
