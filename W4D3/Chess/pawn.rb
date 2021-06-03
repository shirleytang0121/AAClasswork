require_relative "piece.rb"

class Pawn < Piece
    def symbol
        "P"
    end

    def moves
        forward_step + side_attacks
    end

    private
    def at_start_row?
        return true if pos.first == 1 && color == "black" 
        return true if pos.first == 6 && color == "white"
        false
    end

    def foward_dir
        color == "black" ? 1 : -1
    end

    def forward_step
        x, y = pos
        all_moves = []

        one_step = [(x + self.forward_dir), y]
        two_step = [x + (2 * self.forward_dir), y]
        
        all_moves << one_step if board.is_valid?(one_step)
        all_moves << two_step if board.is_valid?(two_step) && self.at_start_row

        all_moves
     
    end

    def side_attacks
        x, y = pos
        side_moves = [[x + forward_dir, y-1], [x + forward_dir, y+1]]

        all_moves = []

        side_moves.each do |move|
            if board.is_valid?(move) && !board.empty?(move) && board[move].color != color
                all_moves << move
            end
        end
        all_moves

    end

end