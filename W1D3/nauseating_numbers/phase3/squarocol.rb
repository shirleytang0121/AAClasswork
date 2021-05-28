require "byebug"
def squarocol?(arr)
   arr2=colom_helper(arr)
   if check_same(arr) || check_same(arr2)
        return true
    else
        return false
    end
end

def colom_helper(arr)
    #debugger
    new_arr=Array.new(arr.length){Array.new(arr.length,0)}
    i=0
    while i<arr.length
        j=0
        while j<arr.length
            new_arr[j][i]=arr[i][j]
            j+=1
        end
        i+=1
    end
    new_arr
end

def check_same(arr)
    #debugger
    arr.each do |sub|
        if sub.uniq.size <= 1
            return true
        end
    end
    false
end

p check_same([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true