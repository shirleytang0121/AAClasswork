require_relative "board"
require_relative "card"
class ComputerPlayer
    def initialize
        @known_cards={}
        @matched_cards = {}
    end

    def receive_revealed_card(position, value)
        @known_cards[position] = value
    end

    def receive_match(pos_1, pos_2)
    end
    
    def get_position(board)  
        #random get a postion i and j    #rand(1..10)
        row=rand(1...board.size)
        col=rand(1...board.size)
        # go check if valid
        if board.is_valid?([row,col]) && board.is_face_down?([row,col])
            return [row,col]
        end
        #return

    end
    
end