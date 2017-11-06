//---------------------
// #bubbleSort


Array.prototype.bubbleSort = function () {
  let arr = this.slice(0);
  let sorted = false;

  while (!sorted) {
    sorted = true;

    for (let i = 1; i < arr.length; i++) {
      let j = i - 1;
      if ( arr[i] < arr[j]) {
          let temp1 = arr[i];  //6
          let temp2 = arr[j];  //4
          arr[j] = temp1;
          arr[i] = temp2;
          sorted = false;
      }
    }
  }
  return arr;
};

// console.log([2,3,6,4,3,8].bubbleSort());

//---------------------
// #substrings


String.prototype.substrings = function () {
  let subs = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i+1; j <= this.length; j++) {
      subs.push(this.slice(i,j));
    }
  }

  return subs;
};

console.log("Hello".substrings());
