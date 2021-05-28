def alternating_vowel(sentence)
    words=sentence.split(" ")
    new_sentence=[]
    words.each_with_index do |word,idx|
        if idx.even?
            new_sentence<<remove_vowel(word)
        else
            new_sentence<<remove_vowel(word.reverse).reverse
        end
    end
    new_sentence.join(" ")

end

def remove_vowel(word)
    word.each_char.with_index do |char,idx|
        if "aeiou".include?(char)
            return word[0...idx]+word[idx+1..-1]
        end
    end
    word
end




p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"