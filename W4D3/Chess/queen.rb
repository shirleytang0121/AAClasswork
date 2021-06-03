require_relative "piece.rb"
require_relative "slideable.rb"
class Queen < Piece
    include Slideable
    def symbol
        "Q"
    end

    private
    def move_dirs
        DIAGONAL_DIRS+HORIZONTAL_DIRS
    end 

end
