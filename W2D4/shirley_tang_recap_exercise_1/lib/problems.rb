# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels=['a','e','i','o','u']
    pairs=[]
    vowel_pair=[]
    (0...words.length).each do |i|
        (i+1...words.length).each do |j|
            pairs<<words[i]+" "+words[j]
        end
    end

    pairs.each do |pair|
        if vowels.all? {|vowel| pair.include?(vowel)}
            vowel_pair<<pair
        end
    end
    vowel_pair

end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).any? { |i|  num%i==0}
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    new_arr=[]
    bigrams.each do |ele|
        if str.include?(ele)
            new_arr<<ele
        end
    end
    new_arr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        new_Hash={}
        if prc==nil
            self.each do |k,v|
                if k==v
                    new_Hash[k]=v
                end
            end
            return new_Hash
        end
        self.each do |k,v|
            if prc.call(k,v)
                new_Hash[k]=v
            end
        end
        new_Hash

    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        all_substring=[]
        (0...self.length).each do |i|
            (i...self.length).each do |j|
                all_substring<<self[i..j]
            end
        end

        target=[]
        all_substring.each do |subs|
            if subs.length==length
                target<<subs
            end
        end

        return all_substring if length==nil

        target

    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        new_str=""
        alphabet=('a'..'z').to_a
        self.each_char do |char|
            idx=(alphabet.find_index(char)+num)%26
            new_str+=alphabet[idx]
        end
        new_str

    end
end
