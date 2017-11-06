import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
  this.handleDelete = this.handleDelete.bind(this);
  this.handleDone = this.handleDone.bind(this);
  this.doneText = this.doneText.bind(this);

  }

  handleDelete(e) {
    e.preventDefault();
    const todo = this.props.todo;
    console.log(this.props.todo.id);
    this.props.deleteTodo(todo);
  }

  handleDone(e) {
    e.preventDefault();
    const todo = this.props.todo;
    todo.done = !(todo.done);
    this.props.updateTodo(todo);
  }
  doneText() {
    if (this.props.todo.done) {
      return "Undo";
    }
    return "Done";
  }

  render() {
    return(
      <div>
        <li>{this.props.todo.title}
        <button onClick={this.handleDone}>{this.doneText()}</button>
        <button onClick={this.handleDelete}>Delete</button></li>
      </div>
    );
  }

}


export default TodoListItem;
