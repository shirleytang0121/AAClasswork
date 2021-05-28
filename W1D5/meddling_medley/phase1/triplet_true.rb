def triplet_true(string)
    return false if string.length<3
    i=0
    while i<string.length-2
        if string[i]==string[i+1]&&string[i]==string[i+2]
            return true
        end
        i+=1
    end
    false
end



p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false