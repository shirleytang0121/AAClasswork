def reverberate(sentence)
    words=sentence.split(" ")
    new_sentence=[]
    vowel="aeiou"
    words.each do |word|
        if word.length<3
            new_sentence<<word
        elsif vowel.include?(word[word.length-1].downcase)
            new_sentence<<word*2
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
    word.reverse.each_char.with_index do |char,idx|
        if "aeiou".include?(char.downcase)
            return word+word[word.length-idx-1..-1]
        end
    end
    return word
end



p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"