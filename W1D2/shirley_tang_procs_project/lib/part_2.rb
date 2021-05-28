def reverser(str, &prc)
    newstr=""
    str.each_char{ |char| newstr=char+newstr}
    prc.call(newstr)
end

def word_changer(sentence, &prc)
    new_sentence=[]
    sentence.split(" ").each{|word| new_sentence<<prc.call(word)}
    new_sentence.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    if prc1.call(num)>prc2.call(num)
        return prc1.call(num)
    else
        return prc2.call(num)
    end
end

def and_selector(arr, proc_1, proc_2)
    newarr=[]
    arr.each{ |el| newarr<<el if proc_1.call(el)==true&&proc_2.call(el)==true}
    newarr
end

def alternating_mapper(arr,proc_1,proc_2)
    newarr=[]
    arr.each_with_index do |el,idx|
        if idx.even?
            newarr<<proc_1.call(el)
        else
            newarr<<proc_2.call(el)
        end
    end
    newarr
end