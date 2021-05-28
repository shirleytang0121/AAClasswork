require "byebug"
def convert_pig_latin(sentence)
    words=sentence.split(" ")
    new_sentence=[]
    vowel="aeiou"
    words.each do |word|
        if word.length<3
            new_sentence<<word
        elsif vowel.include?(word[0].downcase)
            new_sentence<<word+"yay"
        else
            new_sentence<<new_char_helper(word)
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
    word.each_char.with_index do |char,idx|
        if "aeiou".include?(char.downcase)
            return word.downcase[idx..-1]+word.downcase[0...idx]+"ay"
        end
    end
    return word
end





p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"