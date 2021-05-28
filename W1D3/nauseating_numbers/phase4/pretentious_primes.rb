require "byebug"

def pretentious_primes(arr,num)
    prime_list=[]
    new_arr=[]
    
    arr.each do |ele|
        if num>=0
            prime_list=find_prime(ele,ele+num*5)
            if prime_list.include?(ele)
                new_arr<<prime_list[num]
            else 
                new_arr<<prime_list[num-1]
            end
        else 
            prime_list=find_prime(2,ele)
            if prime_list.include?(ele)
                idx=prime_list.length-1+num
                if idx<0
                    new_arr<<nil
                else
                    new_arr<<prime_list[prime_list.length-1+num]
                end
            else
                idx=prime_list.length+num
                if idx<0
                    new_arr<<nil
                else
                    new_arr<<prime_list[prime_list.length+num]
                end
            end
        end

    end
    new_arr
            

end



def find_prime (num1,num2)
    
    prime_arr=[]
    (num1..num2).each do |num|
        if (2...num).none?{ |i| num%i==0 }
            prime_arr<<num
        end
    end
    prime_arr
end


p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]