def average(num_1, num_2)
    (num_1+num_2)/2.0
end

def average_array(arr)
    arr.sum/arr.length.to_f
end

def repeat(str, num)
    newstr=""
    num.times do
        newstr+=str
    end
    newstr

    #str*num
end

def yell(str)
    str.upcase!+"!"
end

def alternating_case(sentence)
    words=sentence.split(" ")
    newstr=[]
    words.each_with_index do |word,idx|
        if idx.even?
            newword=word.upcase
        else
            newword=word.downcase
        end
        newstr<<newword
    end
    newstr.join(" ")
end
