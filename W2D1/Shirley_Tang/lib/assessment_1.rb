# Define your methods here.
require "byebug"

def string_map!(sentence, &prc)
    sentence.each_char.with_index do |char,idx|
        sentence[idx]=prc.call(char)
    end
end


def three?(arr, &prc)
    return false if arr.length<3
    counter=arr.count {|num| prc.call(num)==true}
    return counter==3
end


def nand_select(arr, prc1, prc2)
    nand_arr=[]
    arr.each do |ele|
        if !prc1.call(ele) || !prc2.call(ele)
            nand_arr<<ele
        end
    end
    nand_arr

end 


def hash_of_array_sum(hash)
    new_arr=[]
    hash.each do |k,v|
        new_arr<<v
    end
    new_arr.flatten.sum
end

def abbreviate(sentence)
    words=sentence.split(" ")
    new_sentence=[]
    words.each do |word|
        if word.length>4
            word=remove_helper(word)
        end
        new_sentence<<word
    end
    new_sentence.join(" ")
end

def remove_helper(word)
    newchar=""
    word.each_char do |char|
        if !"aeiou".include?(char.downcase)
            newchar+=char
        end
    end
    newchar
end


def hash_selector(hash, *additional_args)
    return hash if additional_args.length==0
    new_hash={}
    additional_args.each do |ele|
        if hash.has_key?(ele)
            new_hash[ele]=hash[ele]
        end
    end
    new_hash
end

