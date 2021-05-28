require_relative "board"
require_relative "human_player"

class Game
    def initialize(size,*player)
        @size=size
        @player_mark=player
        @board=Board.new(size)
        @current_player=HumanPlayer.new(@player_mark[0])
        @playerList=[]
        (0...@player_mark.length).each do |i|
            @playerList<<HumanPlayer.new(@player_mark[i])
        end
    end


    def switch_turn
        @playerList<<@current_player
        @playerList.shift
        @current_player=@playerList[0]
        @current_player
    end


    def play
        i=0
        while i<@size*@size
            @board.print
            pos=@current_player.get_position
            mark=@current_player.mark
            @board.place_mark(pos,mark)
            if @board.win?(mark)
                @board.place_mark(pos,mark)
                @board.print
                p 'Win'  
                return   
            end
            self.switch_turn
            i+=1
        end
        p "draw"
    end
   
end