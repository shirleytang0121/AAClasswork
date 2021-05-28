class Board
    def initialize(size)
        @size=size
        @grid=Array.new(size){Array.new(size)}
    end

    def size
        @size
    end

    def [] (pos)
        row=pos[0]
        col=pos[1]
        @grid[row][col]
    end


    def []=(pos,mark)
        row=pos[0]
        col=pos[1]
        @grid[row][col]=mark
    end

    def complete_row?(mark)
        @grid.each do |row|
            if row.length==self.size && row.all? {|ele| ele==mark}
                return true
            end
        end
        false
    end


    def complete_col?(mark)
        @grid.transpose.each do |col|
            if col.length==self.size && col.all? {|ele| ele==mark}
                return true
            end
        end
        false
    end

    def complete_diag?(mark)
        dia1=[]
        dia2=[]
        i=0
        while i<self.size
            dia1<<@grid[i][i]
            dia2<<@grid[i][self.size-i-1]
            i+=1
        end
        if dia1.all? {|ele| ele==mark } || dia2.all?{ |ele| ele==mark}
            return true
        else
            return false
        end

    end


    def winner?(mark)
        if complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
            return true
        end
        false
    end
    
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
