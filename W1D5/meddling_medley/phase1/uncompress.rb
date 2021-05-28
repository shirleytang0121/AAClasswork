require "byebug"
def uncompress(string)
    i=0
    #debugger
    while i<string.length-1
        if string[i+1].to_i!=1
            repeat=string[i+1].to_i-2
            string[i+1]=string[i]
            repeat.times do
                string.insert(i+1,string[i])
            end
            i=i+repeat+2
        else
            i+=1
        end
    end
    string
end


uncompress('a2b4c1') # 'aabbbbc'
uncompress('b1o2t1') # 'boot'
uncompress('x3y1x2z4') # 'xxxyxxzzzz'