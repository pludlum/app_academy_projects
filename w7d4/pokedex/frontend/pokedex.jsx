import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import {RECEIVE_ALL_POKEMON, receiveAllPokemon, RECEIVE_POKEMON, receivePokemon} from './actions/pokemon_actions';
import {fetchAllPokemon, catchPokemon} from './util/api_util';
import {requestAllPokemon, requestPokemon} from './actions/pokemon_actions';
import selectAllPokemon from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';



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
window.catchPokemon = catchPokemon;
window.receivePokemon = receivePokemon;
window.RECEIVE_POKEMON = RECEIVE_POKEMON;
window.requestPokemon = requestPokemon;
