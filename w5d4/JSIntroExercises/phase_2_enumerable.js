// -------------
// #myEach

Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

// [1,2,3].myEach( (num) => {
//   console.log(num);
// });


// -------------
// #myMap

Array.prototype.myMap = function (callback) {
  for (let i = 0; i < this.length; i++) {
    this[i] = callback(this[i]);
  }
  return this;
};

// console.log([1,2,3].myMap( (num) => {
//   return num * num;
// }));


// -------------
// #myReduce

Array.prototype.myReduce = function (callback, val) {
  let arr = this;

  if (val === undefined) {
    val = this[0];
    arr = this.slice(1, this.length);
  }

  let reducer = function (el) {
    val = callback(val, el);
  };

  arr.myEach( reducer );
  return val;
};

// console.log([1,2,3].myReduce((total, item) => total + item));
