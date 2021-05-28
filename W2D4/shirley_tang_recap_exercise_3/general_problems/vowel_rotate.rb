def vowel_rotate(str)
    vowel=['a','e','i','o','u']
    collcet_vowel=[]
    new_str=""
    str.each_char do |char|
        if vowel.include?(char)
            collcet_vowel<<char
        end
    end
    last_vowel=collcet_vowel[collcet_vowel.length-1]
    collcet_vowel.unshift(last_vowel)

    str.each_char do |char|
        if vowel.include?(char)
            new_str+=collcet_vowel.shift
        else
            new_str+=char
        end
    end
    new_str

end




p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"