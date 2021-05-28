def anti_prime?(num)
    divisor=divisor_num(num)
    (1..num).each do |ele|
        if divisor_num(ele)>divisor
            return false
        end
    end
    true
end


def divisor_num(num)
    (1..num).count{ |el| num%el==0 }
end



p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false
