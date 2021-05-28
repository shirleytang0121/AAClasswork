def xnor_select(arr, prc1, prc2)
    newarr=[]
    arr.each do |ele|
        if (prc1.call(ele)&&prc2.call(ele)) || (!prc1.call(ele)&&!prc2.call(ele))
            newarr<<ele
        end
    end
    newarr
end






is_even = Proc.new { |n| n % 2 == 0 }
is_odd = Proc.new { |n| n % 2 != 0 }
is_positive = Proc.new { |n| n > 0 }
p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5, -10]