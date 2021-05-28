class HumanPlayer
     attr_accessor :mark

    def initialize(mark)
        @mark=mark
    end
    
    def get_position(legal_positions)
        p "please enter the position "
        input=gets.chomp.split(" ")
        position=input.map{ |ele| ele.to_i}
        if !legal_positions.include?(position)
            puts "not a legal position" 
            raise 'not legal'
        end
        position
    end
    
end