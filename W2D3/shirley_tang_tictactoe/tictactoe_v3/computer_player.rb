class ComputerPlayer
    def initialize(val)
        @mark = val
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        choice = legal_positions.sample
        choice
    end
end