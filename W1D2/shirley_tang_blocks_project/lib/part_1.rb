def select_even_nums(arr)
    arr.select{|num| num.even?}
    #arr.select{&:even?}
end

def reject_puppies(arr)
    arr.reject{ |dog| dog["age"]<=2}
end

def count_positive_subarrays(arr)
    arr.count{|sub| sub.sum>0}
end

def aba_translate(str)
    newstr=""
    vowel="aeiou"
    str.each_char do |char|
        if vowel.include?(char)
            newstr+=char+"b"+char
        else
            newstr+=char
        end
    end
    newstr
end

def aba_array(arr)
    new_arr=arr.map{|word| aba_translate(word)}
end
    