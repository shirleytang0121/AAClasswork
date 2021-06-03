require_relative "piece.rb"
require_relative "king.rb"
require_relative "queen.rb"
require_relative "bishop.rb"
require_relative "knight.rb"
require_relative "null_piece.rb"
require_relative "rook.rb"
require_relative "pawn.rb"

class Board
    def initialize
        @grid = Array.new(8) { Array.new(8) }
           
        (0...8).each do |index|
            @grid[1][index] = Pawn.new("White",self,[1,index])
            @grid[6][index] = Pawn.new("Black",self,[6,index])
        end

        @grid[0][0] = Rook.new("Black",self,[0,0])
        @grid[0][1] = Knight.new("Black",self,[0,1])
        @grid[0][2] = Bishop.new("Black",self,[0,2])
        @grid[0][3] = Queen.new("Black",self,[0,3])
        @grid[0][4] = King.new("Black",self,[0,4])
        @grid[0][5] = Bishop.new("Black",self,[0,5])
        @grid[0][6] = Knight.new("Black",self,[0,6])
        @grid[0][7] = Rook.new("Black",self,[0,7])
        @grid[7][0] = Rook.new("White",self,[7,0])
        @grid[7][1] = Knight.new("White",self,[7,1])
        @grid[7][2] = Bishop.new("White",self,[7,2])
        @grid[7][3] = Queen.new("White",self,[7,3])
        @grid[7][4] = King.new("White",self,[7,4])
        @grid[7][5] = Bishop.new("White",self,[7,5])
        @grid[7][6] = Knight.new("White",self,[7,6])
        @grid[7][7] = Rook.new("White",self,[7,7])
        
        (2..5).each do |i|
            (0..7).each do |j|
                @grid[i][j] = NullPiece.instance
            end
        end
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val
    end

    def is_valid?(pos)
        #return false unless self[pos]==nil
        return false if pos.any? { |ele| ele > 7 || ele < 0}
        true
    end

    def empty?(pos)
        self[pos].empty?
    end

    def move_piece(start_pos, end_pos)
        raise "position is invalid" if self[start_pos] == nil
        raise "position is invalid" if start_pos.any? { |ele| ele > 7 || ele < 0}
        raise "position is invalid" if end_pos.any? { |ele| ele > 7 || ele < 0}
    end


end