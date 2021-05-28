require_relative "card"
require_relative "board"
require_relative "human_player"

class Game
    attr_accessor :previous_pos, :guessed_pos   
    
    def initialize(size)
        @board=Board.new(size)
        @previous_pos=[]
        @guessed_pos=[]
        @human_player=HumanPlayer.new("one")
    end
    

    def compare (pos1, pos2)
       if !(@board[pos1]==@board[pos2])
            @board.hide(pos1)
            @board.hide(pos2)
            puts "not match"
       else
            puts "matches"
       end
    end

    def play
        @board.populate
        @board.render
        while !@board.won?
           
            previous_pos= @human_player.get_position
            @board.reveal(previous_pos)
            @board.render

            
            guessed_pos= @human_player.get_position
            @board.reveal(guessed_pos)
            @board.render

            self.compare(previous_pos,guessed_pos)
            sleep(2)
            @board.render

        end
    end


end
