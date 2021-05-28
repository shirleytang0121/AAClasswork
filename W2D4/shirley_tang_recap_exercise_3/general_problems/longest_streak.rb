def longest_streak(str)
    streak=str[0]
    count=1
    max_length=1
    (0...str.length-1).each do |i|
        if str[i]==str[i+1]
            count+=1
            if count>=max_length
                max_length=count
                streak=str[i]
            end
        else
            count=1
        end
    end
     return streak*max_length


end




p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'