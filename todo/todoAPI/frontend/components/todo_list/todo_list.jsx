import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
    // console.log(this.props.todos);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }
  render() {
    const {todos, createTodo, receiveTodo, removeTodo, clearErrors, updateTodo, deleteTodo} = this.props;
    const todoItems = todos.map(todo => (
      <TodoListItem
        key = {`todo-list-item${todo.id}`}
        todo={todo}
        removeTodo={removeTodo}
        receiveTodo={receiveTodo}
        updateTodo={updateTodo}
        deleteTodo={deleteTodo}/>
    ));

    return (
      <div>
        <ul>
          {todoItems}
        </ul>
        <TodoForm
          createTodo={createTodo}
          errors = {this.props.state.errors}
          clearErrors = {clearErrors}/>
      </div>
    );
  }
}


export default TodoList;
