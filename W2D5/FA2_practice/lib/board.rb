class Board
    def self.build_stacks(n)
        board=Array.new(n){Array.new(0)}
    end

    def initialize(row, col)
        @max_height=col
        @stacks=Board.build_stacks(row)
        if row < 4 || col<4
            raise_error
        end
    end


    def max_height
        @max_height
    end

    def add(token, index)
        if @stacks[index].length<self.max_height
            @stacks[index]<<token
            return true
        end
        false
    end

    def vertical_winner?(token)
        @stacks.each do |row|
            if row.all? {|ele| ele==token} && row.length==max_height
                return true
            end
        end
        false
    end


    def horizontal_winner?(token)
        new_arr=[]
        rows=[]
        (0...@max_height).each do |i|
            (0...@stacks.length).each do |j|
                rows<<@stacks[j][i]    
            end
            new_arr<<rows
            rows=[]
        end
        new_arr.each do |row|
            if row.all? {|ele| ele==token}
                return true
            end
        end
        false
        
    end


    def winner?(token)
        if self.horizontal_winner?(token) ||self.vertical_winner?(token)
            return true
        end
        false
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
