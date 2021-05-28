class Card
    attr_reader :face_up, :value

    def initialize(value, face_up = false)
        @value = value
        @face_up = face_up
    end

    def hide 
        @face_up = false
        
    end

    def reveal 
        @face_up = true
    end

    def to_s 
        if face_up==true
            return @value
        else
            return " "
        end
    end

    def ==(card) # come back
        self.value == card.value
    end

end