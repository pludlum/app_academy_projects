
import {RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO} from '../actions/todo_actions';

import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todosReducer = (todosState = initialState, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      const newState = {};
      action.todos.forEach((todo) => {
        newState[todo.id] = todo;
      });
      return newState;

    case RECEIVE_TODO:
      const addedState = {};
      addedState[action.todo.id] = action.todo;
      const merged = merge({}, todosState, addedState);
      return merged;

    case REMOVE_TODO:
      const removedState = merge({}, todosState);
      delete removedState[action.todo.id];

      return removedState;

    default:
      return todosState;
  }
};

export default todosReducer;
