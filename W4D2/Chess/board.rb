class Board
    def initialize(row)
        @grid = Array.new(row) { Array.new(row) }
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val
    end

    def move_piece(color, start_pos, end_pos)
    end


end