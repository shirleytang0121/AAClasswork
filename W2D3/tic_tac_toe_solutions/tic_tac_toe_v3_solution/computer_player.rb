class ComputerPlayer
    attr_reader :mark

    def initialize(val)
        @mark = val
    end

    def get_position(legal_positions)
        choice = legal_positions.sample
        p 'computer choice is'+choice
        choice
    end
end
