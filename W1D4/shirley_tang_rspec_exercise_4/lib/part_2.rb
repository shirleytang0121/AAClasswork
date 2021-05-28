def proper_factors(number)
    (1...number).select {|ele| number%ele==0}
end


def aliquot_sum(number)
    proper_factors(number).sum
end


def perfect_number?(number)
    return true if number==aliquot_sum(number)
    false
end

def ideal_numbers(n)
    nums=[]
    i=1
    while nums.length<n
        if perfect_number?(i)
            nums<<i
        end
        i+=1
    end
    nums   
end