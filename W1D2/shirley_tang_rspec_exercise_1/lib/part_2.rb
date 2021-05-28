def hipsterfy(word)
    vowel="aeiou"
    last_idx=0
    word.each_char.with_index do |char,idx|
        if vowel.include?(char)
            last_idx=idx
        end
    end
    if last_idx==0
        new_word=word
    else
        new_word=word[0...last_idx]+word[last_idx+1..-1]
    end
    new_word

    #use while loop
end

def vowel_counts(str)
    hash=Hash.new(0)
    vowel="aeiou"
    str.downcase.each_char do |char|
        if vowel.include?(char)
            hash[char]+=1
        end
    end
    hash
end

def caesar_cipher(str, n)
    newstr=""
    newchar=""
    n=n%26
    str.each_char do |char|
        if char.ord>=97 && char.ord<=122
            if char.ord+n>122
                newchar= (96+(char.ord+n-122)).chr
            else
                newchar=(char.ord+n).chr
            end
        else
            newchar=char
        end
        newstr+=newchar
    end
    newstr

    #alphabet=("a".."z").to_a

end

