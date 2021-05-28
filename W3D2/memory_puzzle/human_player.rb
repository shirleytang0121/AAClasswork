class HumanPlayer
    attr_reader :name

    def initialize(name)
        @name=name
    end

    def get_position
        puts "Player #{name} please enter your position"
        pos=gets.chomp
        position=pos.split(" ").map(&:to_i)
        position 
    end
end