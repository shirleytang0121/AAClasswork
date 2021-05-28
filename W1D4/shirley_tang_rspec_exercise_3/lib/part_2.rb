require "byebug"

def element_count(arr)
    count=Hash.new(0)
    arr.each { |ele|  count[ele]+=1}
    count
end



def char_replace!(string, hash)
    string.each_char.with_index do |char,idx|
        if hash.has_key?(char)
            string[idx]=hash[char]
        end
    end
end


def product_inject(arr)
    arr.inject {|accu, ele| accu*ele}
end

