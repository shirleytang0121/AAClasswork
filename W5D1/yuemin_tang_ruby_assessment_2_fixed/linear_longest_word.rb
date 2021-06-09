# Write a method `linear_longest_word` that accepts an array of strings.
# The method should return the longest string in the array. You can assume
# that the array will contain at least one string and there will not be a tie.
#
# Your solution should have a linear - O(n) runtime, where n is the length of
# the array
#
# Scoring: 8 points maximum
#   4 points awarded for passing all test cases
#   4 points awarded for linear runtime
#
# This component of the assessment is estimated to take 10 minutes.
def linear_longest_word(arr)
    max_length=0
    max_str=arr[0]
    arr.each do |str| 
        curr_length=str.length
        if curr_length>max_length
            max_length=curr_length
            max_str=str
        end
    end
    max_str
end


# Test Cases:
p linear_longest_word(['soda', 'mechanic', 'sky', 'stone']) # 'mechanic'
p linear_longest_word(['excellent', 'cat', 'sweep']) # 'excellent'
p linear_longest_word(['door']) # 'door'
