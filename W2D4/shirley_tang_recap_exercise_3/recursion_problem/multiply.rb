def multiply(num_1,num_2)
    return num_1 if num_2==1 
    if num_2>0
         num_1+=multiply(num_1, num_2-1)
    else
        -num_1-=multiply(num_1,num_2+1)
    end
end





p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18