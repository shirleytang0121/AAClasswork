class HumanPlayer
     attr_accessor :mark

    def initialize(mark)
        @mark=mark
    end
    
    def get_position
        p "please enter the position "
        input=gets.chomp.split(" ")
        position=input.map{ |ele| ele.to_i}
        position
    end
    
end