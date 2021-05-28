class Passenger
    def initialize(name)
        @name=name
        @flight_numbers=[]
    end

    def name
        @name
    end

    def has_flight?(flight_num)
        @flight_numbers.any? {|ele| ele==flight_num.upcase}
    end

    def add_flight(flight_num)
        if !self.has_flight?(flight_num.upcase)
            @flight_numbers<<flight_num.upcase
        end
    end

            
            
end