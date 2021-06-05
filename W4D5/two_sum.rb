require 'benchmark'
def bad_two_sum?(arr, target_sum)
    (0...arr.length-1).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
    sorted_arr = arr.sort
    idx1=0
    idx2=arr.length-1
    until idx1 == idx2
        sum = sorted_arr[idx1] + sorted_arr[idx2]
        return true if sum == target_sum
        sum > target_sum ? idx2-=1 : idx1+=1
    end
    false
end

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false


def best_two_sum?(arr, target_sum)
    return true if target_sum.even? && arr.count(target_sum/2) > 1
    complements = Hash.new(nil)
    arr.each { |num|  complements[num]=target_sum - num unless num == target_sum/2 && target_sum.even?}

    complements.values.any? { |comp| !complements[comp].nil? }

end

p best_two_sum?(arr, 6) # => should be true
p best_two_sum?(arr, 10) # => should be false

arr2 = [1,1,2,3,4,5]
p best_two_sum?(arr2,2) 

arr3 = [0, -1, 3, -2, 4, 5, -3, 8, 7, 16, 13, 0, -1, 3, -2, 4, 5, -3, 8, 7, 16, 13, 0, -1, 3, -2, 4, 5, -3, 8, 7, 16, 13, 0, -1, 3, -2, 4, 5, -3, 8, 7, 16, 13]
n=100
Benchmark.bm do |x|
    x.report {  n.times{ bad_two_sum?(arr3,6) } }
    x.report {  n.times{ okay_two_sum?(arr3,6)} }
    x.report {  n.times{ best_two_sum?(arr3,6) }}
end
