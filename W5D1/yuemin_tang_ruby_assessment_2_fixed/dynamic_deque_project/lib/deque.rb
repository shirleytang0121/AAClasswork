class Deque
    def initialize
        @concealed_array=[]
    end
    
    def size
        @concealed_array.length
    end

    def blank?
        return true if @concealed_array.empty?
        false
    end

    def front
        @concealed_array[0]
    end

    def back
        @concealed_array[self.size-1]
    end

    def push_back(ele)
        @concealed_array.push(ele)
        self.size
    end

    def push_front(ele)
        @concealed_array.unshift(ele)
        self.size
    end

    def pop_back
        return nil if self.size==0
        removed=@concealed_array.delete_at(self.size-1)
        removed
    end

    def pop_front
        return nil if self.size==0
        removed=@concealed_array.shift
        removed

    end
end