class Piece
    attr_reader :pos, :board, :color
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        "#{symbol}"
    end

    def empty?

    end

    def symbol
        raise "Do not use this symbol"
    end

    def valid_moves
        moves
    end

    def pos=(val)
        self.pos = val
    end

    private

    def move_into_check?(end_pos)
    end


    
end