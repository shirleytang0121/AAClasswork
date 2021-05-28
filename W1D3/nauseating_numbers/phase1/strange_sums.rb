def strange_sums(arr)
    counter=0
    i=0
    while i<arr.length
        j=i+1
        while j<arr.length
            if arr[i]+arr[j]==0
                counter+=1
            end
        j+=1
        end
        i+=1
    end
    counter
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0