class View {
  constructor (game, rootEl) {
    this.game = game;
    this.$el = rootEl;
    this.startTower = undefined;
    this.endTower = undefined;
    this.render();

    // this.clickTower();
  }

  setupTowers(towersArr) {
    for (var i = 0; i < 3; i++) {
      let $pile = $("<ul class = 'pile'></ul>");
      $pile.data("pileNumber", i);
      this.$el.append($pile);

      for (let j = 0; j < towersArr[i].length; j++) {
        let value = towersArr[i][j];
        let $disc = $(`<li class = 'disc-${value}'></li>`);
        addIcon($disc, value);
        $pile.prepend($disc);
      }
    }

    function addIcon(disc, value) {
      let $i;
      if (value === 1) {
        $i = $("<i class='fa fa-caret-up fa-4x' aria-hidden='true'></i>");
      } else {
        $i = $(`<i class='fa fa-window-minimize fa-${value + 2}x' aria-hidden='true'></i>`);
      }
      disc.append($i);
    }
  }

  render() {
    let $piles = $('ul.pile');
    $piles.remove();
    this.setupTowers(this.game.towers);
    this.clickTower();
    // let test = [[3],[2],[ 1]];
    // this.setupTowers(test);
  }

  clickTower() {
    $('ul.pile').on("click", (event) => {
      let $pile = $(event.currentTarget);
      // debugger;
      if (this.startTower === undefined) {
        this.startTower = $pile.data("pileNumber");
      } else {
        this.endTower = $pile.data("pileNumber");
        this.game.move(this.startTower, this.endTower);
        this.render();
        this.startTower = undefined;
        this.endTower = undefined;
      }
    });
  }
}
module.exports = View;
