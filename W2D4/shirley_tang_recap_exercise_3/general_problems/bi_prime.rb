def bi_prime?(num)
    (2...num).each do |ele|
        if num%ele==0
            fact1=ele
            fact2=num/ele
            return true if prime?(fact1)&&prime?(fact2)
        end
    end
    false

end

def prime?(num)
    (2...num).none? {|factor|  num%factor==0}
end



p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false