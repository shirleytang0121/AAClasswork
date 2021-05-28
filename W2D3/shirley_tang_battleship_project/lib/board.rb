class Board
    def initialize(n)
        @grid=Array.new(n){Array.new(n,:N)}
        @size=n*n
    end

    def size
        @size
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

    def num_ships
        count=0
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                if @grid[i][j]==:S
                    count+=1
                end
            end
        end
        count
end

def attack(pos)
    if self[pos]==:S
        self[pos]=:H
        p 'you sunk my battleship!'
        return true
    else
        self[pos]=:X
        return false
    end
end

def place_random_ships
    num_s=@size*0.25
    i=0
    while i<num_s
        row=rand(0...@grid.length)
        col=rand(0...@grid.length)
        if @grid[row][col]!=:S
            @grid[row][col]=:S
            i+=1
        end
    end
end


def hidden_ships_grid
    newgird=Array.new(@grid.length){Array.new(@grid.length)}
    (0...@grid.length).each do |i|
        (0...@grid.length).each do |j|
            if @grid[i][j]==:S
                newgird[i][j]=:N
            else
                newgird[i][j]=@grid[i][j]
            end
        end
    end
    newgird
end

def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
end


def cheat
    Board.print_grid(@grid)
end


def print
    Board.print_grid(self.hidden_ships_grid)
end





end
