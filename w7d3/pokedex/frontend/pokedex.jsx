import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import {RECEIVE_ALL_POKEMON, receiveAllPokemon} from './actions/pokemon_actions';
import {fetchAllPokemon} from './util/api_util';
import {requestAllPokemon} from './actions/pokemon_actions';
import selectAllPokemon from './reducers/selectors';
import Root from './components/root';



document.addEventListener('DOMContentLoaded', ()=> {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  window.getState = store.getState.bind(store);
  window.dispatch = store.dispatch;

  ReactDOM.render(<Root store={store}/>, rootEl);
});


window.receiveAllPokemon = receiveAllPokemon;
window.RECEIVE_ALL_POKEMON = RECEIVE_ALL_POKEMON;
window.fetchAllPokemon = fetchAllPokemon;
window.requestAllPokemon = requestAllPokemon;
window.selectAllPokemon = selectAllPokemon;
