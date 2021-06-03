require "Singleton"
require_relative "piece.rb"
class NullPiece < Piece

    include Singleton

    attr_reader :symbol, :color
    def initialize
        @symbol = " "
        @color = " "
    end

    def moves
        []
    end
end