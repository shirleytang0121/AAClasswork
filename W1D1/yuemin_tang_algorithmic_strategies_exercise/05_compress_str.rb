# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    count=1
    newstr=[]
    (0...str.length).each do |i|
        if str[i]==str[i+1]
            count+=1
            next
        end     
        compress_helper(str[i],count,newstr)
        count=1
    end
    return newstr.join("")
end

def compress_helper (char,count,newstr)
    if count==1
        newstr.push(char)
    else
        newstr.push(count,char)
    end
    return newstr
end
        




p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
