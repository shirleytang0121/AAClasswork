def squaragonal?(arr)
    reverse_arr=[]
    arr.each do |sub|
        reverse_arr<<sub.reverse
    end
    dia1=dia_helper(arr)
    dia2=dia_helper(reverse_arr)
    if dia1.uniq.size<=1 || dia2.uniq.size<=1
        return true
    else
        return false
    end
end

def dia_helper(arr)
    new_arr=[]
    i=0
    while i<arr.length
        new_arr<<arr[i][i]
        i+=1
    end
    new_arr
end



p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false