def pascals_triangle(num)
    tri=[]
    (1..num).each do |i|
        if i==1
            tri<<[1]
        elsif i==2
            tri<<[1,1]
        else
            tri<<sum_row(tri[i-2])
        end
    end
    tri

end


def sum_row(arr)
    new_arr=[]
    new_arr<<arr[0]
    (0...arr.length-1).each do |i|
        sum=arr[i]+arr[i+1]
        new_arr<<sum
    end
    new_arr<<arr[arr.length-1]
    new_arr
end








p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]