# Define your methods here. 
def first_letter_vowel_count(sentence)
    words=sentence.split(" ")
    vowel="aeiou"
    words.count{ |word| vowel.include?(word[0].downcase)}
end


def count_true(arr, prc)
    arr.count { |num| prc.call(num)}
end


def procformation(arr, prc1, prc2, prc3)
    newarr=[]
    arr.each do |num|
        if prc1.call(num)
            newarr<<prc2.call(num)
        else
            newarr<<prc3.call(num)
        end
    end
    newarr
end

def array_of_array_sum(arr)
    arr.flatten.sum
end


def selective_reverse(sentence)
    words=sentence.split(" ")
    vowel="aeiou"
    new_sentence=[]
    words.each do |word|
        if vowel.include?(word[0]) || vowel.include?(word[word.length-1])
            new_sentence<<word
        else
            new_sentence<<word.reverse
        end
    end
    return new_sentence.join(" ")
end


def hash_missing_keys(hash,*nums)
    nums.select {|num|  !hash.has_key?(num)}
end



