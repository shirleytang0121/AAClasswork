class  Board
    def initialize(n)
        @grid=Array.new(n){Array.new(n,'_')}
    end

    def [](pos)
        row=pos[0]
        col=pos[1]
        @grid[row][col]
    end

    def []=(pos,val)
        row=pos[0]
        col=pos[1]
        @grid[row][col]=val
    end

    def valid?(pos)
        length=@grid.length
        pos.none? {|ele| ele>length-1 ||ele<0}       
    end

    def empty?(pos)
        if self[pos]=='_'
            return true
        end
        return false
    end

    def place_mark(pos,mark)
        if valid?(pos) && empty?(pos)
            self[pos]=mark
        else
            raise_error
        end
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all? {|ele| ele==mark}
                return true
            end
        end
        return false
    end

    def win_col?(mark)
        @grid.transpose.each do |row|
            if row.all? {|ele| ele==mark}
                return true
            end
        end
        return false
    end
    

    def win_diagonal?(mark)
        dia1=[]
        dia2=[]
        i=0
        while i<@grid.length
            dia1<<@grid[i][i]
            i+=1
        end

        new_grid=[]
        @grid.each do |row|
            new_grid<<row.reverse
        end

        j=0
        while j<@grid.length
            dia2<<new_grid[j][j]
            j+=1
        end

        return dia1.all? {|ele| ele==mark} || dia2.all? {|ele| ele==mark}

    end


    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true
        end
        false
    end

    def empty_position?
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                if @grid[i][j]=='_'
                    return true
                end
            end
        end
        false
    end
    


end