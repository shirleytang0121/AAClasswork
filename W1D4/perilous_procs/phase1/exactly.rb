def exactly?(arr,n,&prc)
    ans=[]
    arr.each do |ele|
        if prc.call(ele)
            ans<<ele
        end
    end
    return ans.length==n
end



p exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }         # true
p exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }         # false
p exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }         # true
p exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }  # true
p exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }  # false
p exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }  # true
p exactly?([4, 5], 3) { |n| n > 0 }                             # false
p exactly?([4, 5, 2], 3) { |n| n > 0 }                          # true
p exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }                # true
