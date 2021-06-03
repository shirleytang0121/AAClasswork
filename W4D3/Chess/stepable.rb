module Stepable
    def moves
        valid_moves = []
        cur_x, cur_y = pos
        move_diffs.each do |(dx, dy)|
            new_pos = [cur_x + dx, cur_y + dy]
            if board.is_valid?(new_pos)
                #empty?   color?
                valid_moves << new_pos
            end
        end
    
        valid_moves
    end



    private
    def move_diffs
        raise "wrong direction"
    end

end