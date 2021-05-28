def pair_product(arr, num)
    arr.each_with_index do |el1,idx1|
        arr.each_with_index do |el2,idx2|
            if el1*el2==num && idx1!=idx2
                return true
            end
        end
    end
    false
end


p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false