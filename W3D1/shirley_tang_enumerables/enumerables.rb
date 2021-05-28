class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        new_arr = []

        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end

        # self.each do --> self.my_each do
        new_arr
    end

    def my_reject(&prc)
        new_arr = []

        self.my_each do |ele|
            new_arr << ele if !prc.call(ele)
        end

        new_arr
    end

    def my_any? (&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end

        true
    end

    def my_flatten
        return [self] if !self.kind_of?(Array)
        flatten = []
        self.each do |ele|
            if ele.kind_of?(Array)
                flatten.concat(ele.my_flatten)
            else
                flatten << ele
            end

        end
        flatten
    end

    def my_zip(*arr)
        new_arr = Array.new(self.length) { Array.new(arr.length + 1) }


        (0...self.length).each do |idx1|
            (0...arr.length+1).each do |idx2|
                if idx2 == 0
                    new_arr[idx1][idx2] = self[idx1]
                else
                    new_arr[idx1][idx2]=arr[idx2-1][idx1]
                end
            end
        end
        new_arr
    end

    def my_rotate(pos=1)
        new_index=pos%self.length
        return self[new_index..-1]+self[0...new_index]
    end

    def my_join(str="")
        new_str = ""
        self.each do |ele|

            new_str += ele + str
        end

        if str != ""
            return new_str[0...-1]
        else
            return new_str
        end
    end


    def my_reverse
        new_arr=[]
        self.each do |ele|
            new_arr.unshift(ele)
        end
        new_arr
    end

end


p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [ 1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false

# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


# #  calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3

# p return_value  # => [1, 2, 3]