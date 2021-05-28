def prime_factorization(num)
    return [num] if prime?(num)
    factor_list=[]
    (2..num).each do |factor|
        if num%factor==0
            factor_list+=(prime_factorization(factor)+prime_factorization(num/factor))
            return factor_list
        end
    end

end


def prime?(num)
    (2...num).none? {|factor|  num%factor==0}
end



p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]