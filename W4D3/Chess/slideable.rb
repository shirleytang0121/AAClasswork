module Slideable
    HORIZONTAL_DIRS = [ [0, -1], [0, 1], [1, 0], [-1, 0] ]
    DIAGONAL_DIRS = [ [-1, -1], [-1, 1], [1, -1], [1, 1] ]


    def horizontal_dirs 
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def moves
        all_moves = []
        move_dirs.each do |dx, dy|
            all_moves.concat(grow_unblocked_move_in_dir(dx, dy))
        end
        all_moves
    end

    private

    def move_dirs
        raise "wrong direction"
    end

    def grow_unblocked_move_in_dir(dx, dy)
        new_move = []
        x, y = pos
        new_pos = pos

        while board.is_valid?(new_pos)
            x, y = x + dx, y + dy
            new_pos = [x, y]

            break unless board.is_valid?(new_pos)

            #check empty
            #check color
            new_move << new_pos
     
        end
        new_move
    end
     
end