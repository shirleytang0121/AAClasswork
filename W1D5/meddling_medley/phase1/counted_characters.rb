def counted_characters(sentence)
    char_arr=[]
    count=Hash.new(0)
    sentence.each_char {|char| count[char]+=1}
    count.each do |k,v|
        if v>2
            char_arr<<k
        end
    end
    char_arr
    
end


p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []