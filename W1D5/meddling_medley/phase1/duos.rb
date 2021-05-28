require "byebug"
def duos(word)
    same_length=0
    i=0
    max=0
    #debugger
    while i<word.length-1
        if word[i]==word[i+1]
            same_length+=1
        end
        i+=1
    end
    same_length
end


p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0