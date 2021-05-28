def partition(arr, num)
    arr1=arr.select{|el1| el1<num}
    arr2=arr.select{|el2| el2>=num}

    newarr=[]
    newarr.push(arr1,arr2)
    newarr
    
end

def merge(hash_1, hash_2)
    newhash={}
    hash_1.each do |k,v|
        newhash[k]=v
    end
    hash_2.each do |k,v|
        newhash[k]=v
    end
    newhash
end

def censor(sentence,arr)
    words=sentence.split(" ")
    new_sentnec=[]
    words.each do |word|
        if arr.include?(word.downcase)
            new_sentnec<<replace_helper(word)
        else
            new_sentnec<<word
        end
    end
    new_sentnec.join(" ")
end

def replace_helper(word)
    vowels="aeiou"
    new_word=""
    word.each_char do |char|
        if vowels.include?(char.downcase)
            new_word+="*"
        else
            new_word+=char
        end
    end
    new_word
end


def power_of_two?(num)
    power=1
    return true if power==num
    while power<num
        power*=2
        if power==num
            return true
        end
    end
    false
end 



