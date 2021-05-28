def compress (string)
    newstr=""
    i=0
    consecutives=1
    while i<string.length
        if string[i]==string[i+1]
            consecutives+=1
        else
            if consecutives==1
                newstr=newstr+string[i]
            else
                newstr=newstr+string[i]+consecutives.to_s
            end
            consecutives=1
        end
        i+=1
    end
    newstr
end



p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"