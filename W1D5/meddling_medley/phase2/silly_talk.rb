
def silly_talk(sentence)
    words=sentence.split(" ")
    new_sentence=[]
    vowel="aeiou"
    words.each do |word|
        if vowel.include?(word[word.length-1])
            new_sentence<<word+word[word.length-1]
        else
            new_sentence<<new_char_helper(word.downcase)
        end
    end
    #debugger
    words.each_with_index do |word,idx|
        if word.capitalize==word
            new_sentence[idx]=new_sentence[idx].capitalize
        end
    end

    new_sentence.join(" ")
            
end


def new_char_helper(word)
    newword=""
    word.each_char.with_index do |char|
        if "aeiou".include?(char)
            newword=newword+char+"b"+char
        else
            newword+=char   
        end
    end
    newword
end




p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"