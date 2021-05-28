require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @player=Player.new()
        @board=Board.new(n)
        @remaining_misses=n*n/2
    end


    def board
        @board
    end

    def player
        @player
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses<=0
            p "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships==0
            p "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        if win? || lose?
            return true
        else
            return false
        end

    end

    def turn 
        move=@player.get_move
        if @board.attack(move)==false
            @remaining_misses-=1
        end
            @board.print
            p @remaining_misses
    end





end
