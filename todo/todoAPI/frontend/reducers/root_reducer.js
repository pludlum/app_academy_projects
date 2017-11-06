import {combineReducers} from 'redux';
import errorReducer from './error_reducer';
import todosReducer from './todos_reducer';



 export default combineReducers({
   todos: todosReducer,
   errors: errorReducer
 });
