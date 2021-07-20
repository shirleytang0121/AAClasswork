// Write a function, `longestSymmetricSubstring(string)`, that returns the
// longest substring that is the same forwards and in reverse (for example,
// "abba"). If two substrings are the same length, take the first one.
function longestSymmetricSubstring(string){
    let subs=[];
    if(string === string.split('').reverse().join('')){
        return string;
    }
    for(let i=0; i<string.length;i++){
        for(let j=i+1; j<string.length;j++){
            let substring = string.slice(i,j);
            if(substring === substring.split('').reverse().join('')){
                subs.push(substring);
            }
        }
    }

    let max = subs[0].length;
    let maxsub= subs[0];
    for (let k=0;k<subs.length;k++){
        if(subs[k].length>max){
            max = subs[k].length;
            maxsub=subs[k];
        }
    }
    return maxsub;
}


// Write an `Array.prototype.myEach(callback)` method that invokes a callback
// for every element in an array and returns undefined. 

// **Do NOT use the built-in `Array.prototype.forEach` method in your 
// implementation.**
Array.prototype.myEach=function(callback){
    for(let i=0; i<this.length;i++){
       callback(this[i]);
    }
}


// Write an `Array.prototype.myMap(callback)` method, that takes a callback and 
// returns a new array containing the result of the callback for each element in 
// the array. Use the `Array.prototype.myEach` method you defined above. 
//
// **Do NOT call the built-in `Array.prototype.forEach` or `Array.prototype.map` 
// methods in your implementation.**

Array.prototype.myMap= function(callback){
    let new_arr=[];
    this.myEach(el =>{ 
        new_arr.push(callback(el));
    })

    return new_arr;
}

// Write a function `pairMatch(array, callback)`. It should return all pairs
// of indices ([i, j]) for which `callback(array[i], array[j])` returns true.
//
// NB: Keep in mind that the order of the arguments to the callback may matter.
// e.g., callback = function(a, b) { return a < b }

function pairMatch(array, callback){
    let result=[]
    for(let i=0; i<array.length-1;i++){
       for(let j= i+1; j<array.length;j++){
           if(callback(array[i],array[j])){
                result.push([i,j]);
           }
           if(callback(array[j],array[i])){
               result.push([j,i]);
           }
       }
    }

    result.sort();
  
    return result;
}


// Write a recursive function, `binarySearch(sortedArray, target)`, that returns
// the index of `target` in `sortedArray`, or -1 if it is not found. 
//
// **Do NOT use the built-in `Array.prototype.indexOf` or
// `Array.prototype.includes` methods in your implementation.**
//
// Here's a quick summary of the binary search algorithm:
//
// Start by looking at the middle item of the array. If it matches the target,
// return its index. Otherwise, recursively search either the left or the right
// half of the array until the target is found or the base case (empty array) is
// reached.

function binarySearch(sortedArray, target){
    if (sortedArray.length === 0){
        return -1;
    }

    let mid = Math.floor(sortedArray.length/2);
    if(sortedArray[mid] === target){
        return mid;
    }else if(target < sortedArray[mid]){
        let left = sortedArray.slice(0,mid);
        return binarySearch(left,target)
    }else{
        let right = sortedArray.slice(mid+1);
        let result = binarySearch(right,target);
        if(result === -1){
            return -1;
        }else{
            return result+mid+1;
        }
    }
}


// Write a `Function.prototype.myBind(context)` method. It should return a copy
// of the original function, where `this` is set to `context`. It should allow 
// arguments to the function to be passed both at bind-time and call-time.

Function.prototype.myBind= function(context,...bindArgs){
    const that =this;
    return function(...callArgs){
        return that.apply(context, bindArgs.concat(callArgs));
    };
}

// Write a function, `inherits(ChildClass, ParentClass)`. It should extend the
// methods of `ParentClass.prototype` to `ChildClass.prototype`. 
//
// **Do NOT use `Object.create`, `Object.assign`, `Object.setPrototypeOf`, or
// modify the `__proto__` property of any object directly.**
function inherits(ChildClass, ParentClass){
    function Surrogate(){}
    Surrogate.prototype = ParentClass.prototype;
    ChildClass.prototype = new Surrogate();
    ChildClass.prototype.constructor = ChildClass;
}

// Write a function `myCurry(fn, object, numArgs)`, that curries the function.
// Remember that a curried function is invoked with one argument at a time. For
// example, the curried form of `sum(1, 2, 3)` would be written as
// `curriedSum(1)(2)(3)`. After `numArgs` have been passed in, invoke the
// original `fn` with the accumulated arguments, using `object` as the
// context.

function myCurry(fn, object, numArgs){
    let nums=[];
    return function _myCurry(el){
        nums.push(el);
        if(nums.length < numArgs){
            return _myCurry;
        }else{
            return fn.apply(object,nums);
        }
    }
}

