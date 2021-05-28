def palindrome? (str)
    new_str=""
    str.each_char do |char|
        new_str=char+new_str
    end
    return true if new_str==str
    false
end


def substrings(str)
    str_arr=[]
    length=str.length
    i=0
    while i<length
        j=i
        while j<length
            str_arr<<str[i..j]
            j+=1
        end
        i+=1
    end
    str_arr
end


def palindrome_substrings(string)
    pal_sub=[]
    sub_str=substrings(string)
    sub_str.each do |str|
        if palindrome?(str)==true && str.length>1
            pal_sub<<str
        end
    end
    pal_sub
end
    