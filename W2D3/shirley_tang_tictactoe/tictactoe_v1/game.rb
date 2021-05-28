require_relative "board"
require_relative "human_player"

class Game
    def initialize(player_1,player_2)
        @current_player=HumanPlayer.new(player_1)
        @board=Board.new
        @player_1=HumanPlayer.new(player_1)
        @player_2=HumanPlayer.new(player_2)
    end


    def switch_turn
        if @current_player==@player_1
            @current_player=@player_2
        else
            @current_player=@player_1
        end
    end


    def play
        i=0
        self.switch_turn
        while i<9
            @board.print
            pos=@current_player.get_position
            mark=@current_player.mark
            @board.place_mark(pos,mark)
            if @board.win?(mark)
                p 'Win'  
                return   
            end
            self.switch_turn
            i+=1
        end
        p "draw"
    end
   
end