def range(num1,num2)
    return [] if num1>=num2
  
    range(num1,num2-1)<<num2-1
end

# p range(1, 5)


def iterator_sum(arr)
    sum=0
    arr.each do |ele|
        sum+=ele
    end
    sum
end


def recursion_sum(arr)
    return 0 if arr.length==0
    return arr[0] if arr.length==1

    arr[0]+=recursion_sum(arr[1..-1])
end


# my_arr1=[1,2,3,4,5,6]
# p iterator_sum(my_arr1)
# p recursion_sum(my_arr1)


def exp1(b,power)
    return 1 if power==0

    b*exp1(b,power-1)
end


def exp2(b,power)
    return 1 if power==0
    return b if power==1

    if power.even?
        exp2(b,power/2)**2
    else
        b*(exp2(b,(power-1)/2)**2)
    end
end

# p exp1(2,4)
# p exp2(2,4)

class Array

    def deep_dup
        return [self] if !self.is_a?(Array)
        new_arr=[]
        self.each do |ele|
           new_arr+=ele.deep_dup
        end
        new_arr
    end

end

# my_arr2=[1, [2], [3, [4]]]
# p my_arr2.deep_dup


def recursive_fibonacci(n)
    return [0] if n==0
    return [0,1] if n==1
    prev_step=recursive_fibonacci(n-1)
    prev_step<<prev_step[-1]+prev_step[-2]
    prev_step
end


def iterator_fibonacci(n)
    return [0] if n==0
    return [0,1] if n==1
    fibo_arr=[0,1]
    (n-1).times do 
        fibo_arr<<fibo_arr[-1]+fibo_arr[-2]
    end
    fibo_arr

end


# p recursive_fibonacci(7)
# p iterator_fibonacci(7)


def bsearch(array, target)
    middle=array.length/2
    return nil if array[middle]==nil
    return middle if array[middle]==target
    if array[middle]>target
        bsearch(array[0...middle],target)
    else
        bsearch(array[middle+1..-1],target)
    end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(arr)
    return arr if arr.length==0 || arr.length==1
    m=arr.length/2
    
end

def merge_helper
end


def subsets(arr)
    return [arr] if arr.length==0

    all_subs=[]
    all_subs<<[arr[0]]
    all_subs<<subsets(arr[1..-1])
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]


def permutations(array)

end



