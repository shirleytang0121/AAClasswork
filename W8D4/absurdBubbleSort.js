const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  reader.question(`Is ${el1} greater than ${el2}? `, function (answer){
    if (answer === 'yes'){
        callback(true);
    }else{
        callback(false);
    }
  })
  // callback if true; else false.
}

// askIfGreaterThan(2,3,(answer) => console.log(answer))

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  if (i < arr.length - 1){
      madeAnySwaps = false
      askIfGreaterThan(arr[i], arr[i+1], function (isGreaterThan){
          if (isGreaterThan){
              let temp = arr[i];
              arr[i] = arr[i+1];
              arr[i+1] = temp;
              madeAnySwaps = true;
            }
        i++;
        innerBubbleSortLoop(arr,i,madeAnySwaps,outerBubbleSortLoop);
      });
  }else{
      // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
      //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
      //    continue the inner loop. You'll want to increment i for the
      //    next call, and possibly switch madeAnySwaps if you did swap.
    outerBubbleSortLoop(madeAnySwaps);
    return
  }
}

// innerBubbleSortLoop([3,2,1],0,true,(element)=>console.log(element))

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if (madeAnySwaps){
        return innerBubbleSortLoop(arr,0,true,outerBubbleSortLoop);
    }
    return sortCompletionCallback(arr);
  }
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
    return outerBubbleSortLoop(true)
}

absurdBubbleSort([4,3, 2, 1], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});

