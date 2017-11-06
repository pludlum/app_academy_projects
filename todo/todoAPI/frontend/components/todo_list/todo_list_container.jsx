import {connect} from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import {receiveTodo, removeTodo, fetchTodos, createTodo, updateTodo, deleteTodo} from '../../actions/todo_actions';
import {clearErrors} from '../../actions/error_actions';

const mapStateToProps = state => ({
  todos: allTodos(state),
  state
});


const mapDispatchToProps = dispatch => ({
  clearErrors: () => dispatch(clearErrors()),
  deleteTodo: todo => dispatch(deleteTodo(todo)),
  updateTodo: todo => dispatch(updateTodo(todo)),
  createTodo: todo => dispatch(createTodo(todo)),
  removeTodo: todo => dispatch(removeTodo(todo)),
  fetchTodos: todos => dispatch(fetchTodos(todos))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
  )(TodoList);
