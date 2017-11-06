const View = require('./ttt-view.js');
const Game = require('./game.js');

$( () => {
  // Your code here
  let game = new Game();

  const $figure = $("figure.ttt");

  new View(game, $figure);

  
});
