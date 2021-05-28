def char_indices(str)
    hash={}
    str.each_char.with_index do|char,idx|
        if hash.has_key?(char)
            hash[char]<<idx
        else
            hash[char]=[idx]
        end
    end
    hash
end


p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}