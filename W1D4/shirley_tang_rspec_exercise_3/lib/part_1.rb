def is_prime?(num)
    return false if num<2
    (2...num).none?{|ele| num%ele==0}
end


def nth_prime(n)
    prime_list=[]
    i=0
    while prime_list.length < n
        if is_prime?(i)
            prime_list<<i
        end
        i+=1
    end
    prime_list[prime_list.length-1]
end


def prime_range(min,max)
    primes=[]
    (min..max).each do |num|
        if is_prime?(num)
            primes<<num
        end
    end
    primes
end
