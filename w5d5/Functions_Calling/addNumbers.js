const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if(numsLeft > 0) {
    reader.question("Enter a number: ", function(answer) {
          sum = Number.parseInt(answer)+sum;
            console.log(`${sum}`);
                    addNumbers(
                    (sum),
                    (numsLeft-1),
                    completionCallback);});
  } else {
    completionCallback(sum);
    reader.close();
  }
}


addNumbers(0, 5, function(arg1) {
  console.log(`${arg1}`);
});
