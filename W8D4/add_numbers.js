const readline = require('readline');
const read = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
    if ( completionCallback === undefined ){
        completionCallback =  console.log(`Total Sum: ${sum}`)
    }
    if(numsLeft > 0){
        read.question("Input number ", function (num){
           let number = parseInt(num);
           sum += number;
           console.log(`partial sum: ${sum}`);
           console.log(numsLeft);
           numsLeft--;
           return addNumbers(sum, numsLeft, completionCallback);
        })
    }else if(numsLeft === 0){
        return completionCallback(sum);
    }

}


console.log(addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`)))