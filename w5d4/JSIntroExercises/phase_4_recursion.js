
//=======================
// range(start, end)


function range(start, end){
  if (start === end) {return [end];}

  return [start].concat(range(start + 1, end));
}

// console.log(range(1, 5));



//======================
// sumRec(arr)

function sumRec(arr) {
  if (arr.length === 1) {return arr[0];}

  return arr[0] + sumRec(arr.slice(1, arr.length));
}

// console.log(sumRec([1,2,3]));


//=====================
// exponent(base, exp)


function exponent(base, exp) {
  if (exp === 0) {return 1;}

  return base * exponent(base, exp - 1);
}

// console.log(exponent(2, 4));

function weirdExponent(base, exp) {
  if (exp === 0) {return 1;}
  if (exp === 1) {return base;}

  if (exp % 2 === 0) {
    return Math.pow(weirdExponent(base, exp/2), 2);
  } else {
    return base * (Math.pow(weirdExponent(base, ((exp - 1) / 2)), 2));
  }
}

// console.log(weirdExponent(2, 4));
// console.log(weirdExponent(2, 3));

//=====================
// finbonacci(n)


function fibonacci(n) {
  let base_fibs = [0, 1];
  if (n <= 2) {return base_fibs.slice(0, n);}

  let fibs = fibonacci(n-1);

  return  fibs.concat(fibs[fibs.length-2] + fibs[fibs.length-1]);
}
// console.log(fibonacci(5));



//=====================
// bsearch(arr, target)

function bsearch(arr, target) {
  if (arr.length === 0) {return -1;}

  let mid = Math.floor(arr.length / 2);

  if (arr[mid] === target) {
    return mid;}

  if (arr[mid] > target) {
    return bsearch(arr.slice(0, mid), target);
  } else {
    var result = bsearch(arr.slice(mid+1), target);
  }

  if (result > -1) {result += arr.slice(0,mid+1).length;}
  return result;
}

// console.log(bsearch([1, 2, 3, 4, 5], 10));


//=====================
// mergeSort(arr)


function mergeSort(arr) {
  if (arr.length <= 1) {return arr;}

  let mid = Math.floor(arr.length/2);
  let left = arr.slice(0,mid);
  let right = arr.slice(mid, arr.length);

  return merge(mergeSort(left), mergeSort(right));
}



function merge(left, right) {
  let result = [];

  while (left.length > 0 && right.length > 0) {
    if (left[0] > right[0]) {
      result.push(right.shift());
    } else{
      result.push(left.shift());
    }
  }

  result = result.concat(left);
  result = result.concat(right);
  return result;
}

// console.log(merge([1,2,5], [3,5]));

// console.log(mergeSort([2,6,3,8,4,2]));


//=====================
// subsets(arr)


function subsets(arr) {
  if (arr.length === 0) { return [[]]; }

  let first = [arr[0]];
  let remainder = subsets(arr.slice(1));

  let withFirst = remainder.map(sub => first.concat(sub));

  return remainder.concat(withFirst);
}

console.log(subsets([1,2,3,4]));
