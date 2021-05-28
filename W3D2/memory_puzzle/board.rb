require_relative "card"
class Board
    attr_reader :size

    def initialize(size)
        raise 'odd size' if size.odd?
        @size=size
        @grid=Array.new(size+1){Array.new(size+1)}
        (1..size).each do |i|
            @grid[0][i]=i
            @grid[i][0]=i
        end
    end


    def [] (pos)
        row=pos[0]
        col=pos[1]
        @grid[row][col]
    end


    def []=(pos,value)
        row=pos[0]
        col=pos[1]
        @grid[row][col]=value
    end

    def populate
        alphabet= ('a'..'z').to_a
        possible_value= alphabet.sample(size*size/2) 
        card_arr=[]
        (0...size*size/2).each do |i|
            card_arr<<Card.new(possible_value[i])
            card_arr<<Card.new(possible_value[i])
        end
       
        card_arr.shuffle!
        
        (1...@grid.length).each do |idx1|
            (1...@grid.length).each do |idx2|
                @grid[idx1][idx2]=card_arr.pop() 
            end
        end
    end

    
    def render
        system("clear")
        (0...@grid.length).each do |idx1|
            (0...@grid.length).each do |idx2|
                if idx1==0 || idx2==0
                    print " #{@grid[idx1][idx2]} "
                else    
                    print "#{@grid[idx1][idx2].to_s}  "
                end
            end

            puts "\n"
        end
    end

    def is_valid?(pos)
        row=pos[0]
        col=pos[1]
        return true if row<=size && row>0 && col>0 && col<=size
        false
    end

    def is_face_down?(pos)
        row=pos[0]
        col=pos[1]
        return true if @grid[row][col].face_up==false
        false
    end

    def reveal(guessed_pos)
        if is_valid?(guessed_pos) && is_face_down?(pos)
            self[guessed_pos].reveal
            return true
        end
        false
    end

    def hide (guessed_pos)
        if is_valid?(guessed_pos)
            self[guessed_pos].hide
            return true
        end
        false
    end

    def won?
        (1...@grid.length).each do |idx1|
            (1...@grid.length).each do |idx2|
                if @grid[idx1][idx2].face_up==false
                    return false
                end
            end
        end
        true
    end



end