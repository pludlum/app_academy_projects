
'use strict';

// #uniq

Array.prototype.uniq = function () {
  let arr = [];

  for (let i = 0; i < this.length; i++) {
    if (arr.indexOf(this[i]) === -1) {
      arr.push(this[i]);
    }
  }
  return arr;
};


// #twoSum


Array.prototype.twoSum = function (target = 0) {

  let combos = [];

  for (let i = 0; i < this.length; i++) {

    for (let j= i + 1; j < this.length; j++) {
      if (this[i] + this[j] === target) {
        combos.push([i, j]);
      }
    }
  }
  return combos;
};


// #transpose

Array.prototype.transpose = function () {
  let result = [];

  for (let i = 0; i < this.length; i++) {
    let subArr = [];

    for (let j = 0; j < this.length; j++) {
      subArr.push(this[j][i]);
    }
    result.push(subArr);
  }
//[[1,4],
  return result;
};

console.log([[1,2,3], [4,5,6], [7,8,9]].transpose());
