def procipher(sentence, hash_prc)
    words=sentence.split(" ")
    word_arr=[]
    words.each do |word|
        new_word=word
        hash_prc.each do |k,v|
            if k.call(word)
                new_word=v.call(new_word)
            end
        end
        word_arr<<new_word
    end
    return word_arr.join(" ")
                
end



is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
make_question = Proc.new { |s| s + '???' }
reverse = Proc.new { |s| s.reverse }
add_smile = Proc.new { |s| s + ':)' }

p procipher('he said what!',
    is_yelled => make_question,
    contains_a => reverse
) # "he dias ???!tahw"

p procipher('he said what!',
    contains_a => reverse,
    is_yelled => make_question
) # "he dias !tahw???"

p procipher('he said what!',
    contains_a => reverse,
    is_yelled => add_smile
) # "he dias !tahw:)"

p procipher('stop that taxi now',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "stop that??? taxi??? now"

p procipher('STOP that taxi now!',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "STOP:) that??? taxi??? !won"