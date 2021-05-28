require "byebug"

def matrix_addition_reloaded(*matrix)
    #debugger
    matrix_sum=Array.new(matrix[0].length){Array.new(matrix[0][0].length,0)}
    (0...matrix.length).each do |i|
        if matrix_size_check(matrix[i],matrix_sum)==false
            return nil
        end
        matrix_sum=matrix_addition(matrix_sum,matrix[i])
    end
    matrix_sum
end

def matrix_size_check(matrix_1,matrix_2)
    if matrix_1.length==matrix_2.length && matrix_1[0].length==matrix_2[0].length
        return true
    else
        return false
    end
end

def matrix_addition(matrix_1,matrix_2)
    i=0
    ans=[]
    sum_row=[]
    while i<matrix_1.length
        j=0
        while j<matrix_1[i].length
            sum=matrix_1[i][j]+matrix_2[i][j]
            sum_row<<sum
            j+=1
        end
        ans<<sum_row
        sum_row=[]
        i+=1
    end
    ans
end



matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil