require_relative 'deque'
class DynamicDeque < Deque
    def initialize(num)
        @max_volume=num
    end

    def max_volume
        @max_volume
    end

    def middle
        return [] if @concealed_array.nil?
        middle=self.size/2
        if self.size.even?
            return [@concealed_array[middle-1],@concealed_array[middle]]
        else
            return [@concealed_array[middle]]
        end
    end


    def push_back(*eles)
        raise 'duque is full' if @max_volume <= self.size + eles.length
        
        self.size
    end



    def pop_front(n=0)
        removed=[]
        if n==0
           return [@concealed_array.shift]
            
        else
            n.times {  removed<< @concealed_array.shift}
        end
        removed
    end
end