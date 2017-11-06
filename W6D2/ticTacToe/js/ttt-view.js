const MoveError = require("./moveError");

class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $('ul.grid').on("click", "li", (event) => {
      let $target = $(event.target);
      if (!this.game.isOver()) {
        try {
          this.makeMove($target);
        } catch (e) {
          if (e instanceof MoveError) {
            alert(e.msg);
          } else {
            throw e;
          }
        }
      }
    });
  }

  makeMove($target) {
    this.game.playMove([$target.data('row'), $target.data('col')]);

    $target.css('background-color', 'white');
    $target.data('curColor', 'white');
    $target.text(this.game.currentPlayer.toUpperCase());

    let $div = $("<div class = 'message' ></div>");
    if (this.game.isOver()) {
      // let winner;
      if (this.game.winner() === null) {
        // winner = "Nobody";
        $div.text(`Nobody wins the game!`);
      } else {
        // winner = this.game.winner().toUpperCase();
        $div.text(`${this.game.currentPlayer.toUpperCase()} wins the game!`);
      }
      $div.css('font-size', '40px');
      this.$el.append($div);
    }
  }

  setupBoard() {
    let $ul = $("<ul class = 'grid' ></ul>");
    $ul.css('width', '620');
    $ul.css('display', 'float');

    // function handlerIn($el) {
    //   $el.css("background-color", "yellow");
    // }
    //
    // function handlerOut($el) {
    //   $el.css("background-color", "gray");
    // }

    this.$el.append($ul);

    for (let r = 0; r < 3; r++) {
      for (let c = 0; c < 3; c++) {
        let $li = $("<li class= 'square'></li>");
        // $li.css('display', 'float');
        $li.css("float", "left");
        $li.css("border-style", "solid");
        $li.css("border-width", "3px");
        $li.css("list-style-type", "none");
        $li.css("width", "200");
        $li.css("height", "200");
        $li.css("background-color", "gray");
        $li.css("font-size", "150px");
        $li.data('row', r);
        $li.data('col', c);
        $li.data('curColor', 'gray');

        let game = this.game;
        $li.hover(
          function () {
            // debugger
            if ($(this).data('curColor') === 'gray' && !game.isOver()) {
              if (game.currentPlayer === 'x') {
                // $(this).addClass('hoveryellow')
                $(this).css("background-color", "yellow");
              } else {
                // $(this).addClass('hoveryellow')
                $(this).css("background-color", "pink");
              }
            }
          }, function () {
            $(this).css("background-color", $(this).data('curColor'));
          }
        );
        $ul.append($li);
      }
    }
  }
}

module.exports = View;
