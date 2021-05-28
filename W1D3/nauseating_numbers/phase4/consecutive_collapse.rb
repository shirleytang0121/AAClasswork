def consecutive_collapse(arr)
    new_arr=arr
    i=0
    while i<new_arr.length-1
        if new_arr[i]+1==new_arr[i+1] || new_arr[i]-1==new_arr[i+1]
            new_arr=new_arr[0...i]+new_arr[i+2..-1]
            i=0
        else
           i+=1
        end
    end
    new_arr
end




p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []