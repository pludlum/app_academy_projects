import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';

import store from './store/store';
import {receiveTodo, receiveTodos} from './actions/todo_actions';
import allTodos from './reducers/selectors';

document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(<Root store={store()} />, document.getElementById('root'));
});


window.store = store();
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodo;
window.allTodos = allTodos;
