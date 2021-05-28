def tribonacci_number(num)
    tribo=0
    tribo_arr=[]
    (1..num).each_with_index do |el,idx|
        if el==1 ||el==2
            tribo=1
        elsif el==3
            tribo=2
        else
            tribo=tribo_arr[idx-3...idx].sum
        end
        tribo_arr<<tribo
    end
    tribo_arr[tribo_arr.length-1]
end




p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274