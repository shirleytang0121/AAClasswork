def b_search(arr,target)
    return nil if arr.length<1
    middle=arr.length/2
    return middle if arr[middle]==target

    lower_half=arr[0...middle]
    higher_half=arr[middle+1..-1]

    if target<arr[middle] 
        b_search(lower_half,target)
    else
        result=b_search(higher_half,target)
        if result==nil
            return nil
        else
            lower_half.length + 1 + result
        end
    end

end

p b_search([1, 2, 3], 1) # => 0
p b_search([2, 3, 4, 5], 3) # => 1
p b_search([2, 4, 6, 8, 10], 6) # => 2
p b_search([1, 3, 4, 5, 9], 5) # => 3
p b_search([1, 2, 3, 4, 5, 6], 6) # => 5
p b_search([1, 2, 3, 4, 5, 6], 0) # => nil
p b_search([1, 2, 3, 4, 5, 7], 6) # => nil




def merge_sort(arr)
    return arr.length if arr.length==1

    middle=arr.length/2
    first_half=arr[0...middle]
    second_half=arr[middle..-1]

    left = merge_sort(first_half)
    right = merge_sort(second_half)

    merge(left,right)
    
end


def merge(left, right)
    combined_arr=[]

   

    until left.empty? || right.empty?
        if left[0]<right[0]
            combined_arr<<left.shift
        else
            combined_arr<<right.shift
        end
    end


    if left.empty?
        combined_arr.concat(right)
    end

    if right.empty?
        combined_arr.concat(left)
    end

    combined_arr
end

p merge_sort([2,1,6,-3,11,7])