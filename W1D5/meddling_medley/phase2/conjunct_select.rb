def conjunct_select(arr,*prcs)
    newarr=arr
    prcs.each do |prc|
        passed_arr=[]
        arr.each do |num|
            if prc.call(num)
                passed_arr<<num
            end
        end
        newarr=newarr&passed_arr
    end
    newarr
end


is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]