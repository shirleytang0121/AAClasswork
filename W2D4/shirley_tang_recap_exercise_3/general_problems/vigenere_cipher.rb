def vigenere_cipher(str,keys)
    alphabet=('a'..'z').to_a
    length=keys.length
    new_str=""
    str.each_char.with_index do |char,idx|
        key=keys[idx%length]
        new_idx=(alphabet.find_index(char)+key)%26
        new_str+=alphabet[new_idx]
    end
    new_str
end





p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"