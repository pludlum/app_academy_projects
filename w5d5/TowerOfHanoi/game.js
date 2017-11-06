const readline = require('readline');

class Game {

  constructor(){
    this.stacks= new Array(3);
    for (var i = 0; i < this.stacks.length; i++) {
      this.stacks[i] = [];
    }
    this.stacks[0] = [1,2,3];
  }

  promptMove(callback) {
    const rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout
    });
    this.printStacks();
    rl.question('Pick starting stack and landing stack: ', (answer) => {
      let startTowerIdx = answer[0] * 1;
      let endTowerIdx = answer[1] * 1;
      rl.close();
      console.log(callback(startTowerIdx, endTowerIdx));
    });

  }

  printStacks() {
    console.log(JSON.stringify(this.stacks));
  }

  isValidMove(startTowerIdx, endTowerIdx){
      if (startTowerIdx === endTowerIdx) {
        return false;
      }
      const range = [0,1,2];
      if (!range.includes(startTowerIdx) || !range.includes(endTowerIdx)) {
        return false;
      }

      if (this.stacks[startTowerIdx].length === 0) {
        return false;}
      if (this.stacks[endTowerIdx].length === 0) {
        return true;}
      if (this.stacks[startTowerIdx][0] < this.stacks[endTowerIdx][0]) {
        return true;
      } else {
        return false;
      }
  }

  move(startTowerIdx, endTowerIdx) {
    if(this.isValidMove(startTowerIdx, endTowerIdx)) {
      var movingPlate = this.stacks[startTowerIdx].shift();
      this.stacks[endTowerIdx].unshift(movingPlate);
    } else {
      throw 'Invalid move!!!!!!';
    }
    this.printStacks();
  }

  isWon(){
    if (this.stacks[1].length === 3 || this.stacks[2].length ===3) {
      return true;
    } else {
      return false;
    }
  }

  run(callback) {
    this.promptMove(this.move.bind(this));
    
    if (!this.isWon()) {
      this.run(callback);
    } else {
      callback();
    }
  }
}


const game = new Game();

game.run(()=> {console.log("You won! Congrats!!!!!");});
