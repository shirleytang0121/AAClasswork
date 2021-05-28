# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    pf=0
    (2..num).each do |factor|
        if num%factor==0 && prime?(factor)
            pf=factor
        end
    end
    pf

end

def prime?(num)
    return false if num<2
    (2...num).each do |item|
        if num%item==0
            return false
        end
    end
    true
end



def unique_chars?(word)
    counter=Hash.new(0)
    word.each_char{|char| counter[char]+=1}

    counter.each_value do |val|
        if val>1
            return false
        end
    end
    true
end



def dupe_indices(arr)
    #indices=Hash.new { |k,v| k[v]=[]}
    hash={}
    arr.each_with_index do |char,idx|
        if hash.has_key?(char)
            hash[char]<<idx
        else
            hash[char]=[idx]
        end
    end
    hash.each do |k,v|
        if v.length<2
            hash.delete(k)
        end
    end
    #hash.select{ |ele, arr| arr.length>1}
    hash
end


def ana_array(arr_1, arr_2)
    return false if arr_1.length != arr_2.length

    (0...arr_1.length).each do |i|
        if !arr_1.include?(arr_2[i]) || !arr_2.include?(arr_1[i])
            return false
        end
    end
    return true
end