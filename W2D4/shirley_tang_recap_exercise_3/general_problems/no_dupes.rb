
def no_dupes?(arr)
    count=Hash.new(0)
    new_arr=[]
    arr.each { |ele| count[ele]+=1}
    count.each do |k,v|
        if v==1
            new_arr<<k
        end
    end
    new_arr
end

p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []