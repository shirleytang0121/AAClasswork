def mersenne_prime(num)
    ans=1
    i=0
    while i<=num
        ans*=2
        if (2...ans-1).any? {|el|  (ans-1)%el==0}
            i-=1
        end 
        i+=1
    end
    ans-1
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071