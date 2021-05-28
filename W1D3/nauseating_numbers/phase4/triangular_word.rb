def triangular_word?(word)
    tri_num=[]
    word_encode=encode(word)
    (1..word_encode).each {|i|   tri_num<<(i*(i+1)/2)}
    return tri_num.include?(word_encode)
end


def encode(word)
    num_encode=0
    word.each_char do |char|
        num_encode+=(char.ord-96)
    end
    num_encode
end



p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false