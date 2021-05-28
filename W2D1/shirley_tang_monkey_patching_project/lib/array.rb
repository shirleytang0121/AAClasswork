# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span 
        if self.length==0
            nil
        else
            self.max-self.min
        end
    end


    def average
        if self.length==0
            nil
        else
            self.sum/(self.length*1.0)
        end
    end


    def median
        if self.length==0
            nil
        elsif self.length.even?
            (self.sort[self.length/2]+self.sort[self.length/2-1])/2.0
        else
            self.sort[self.length/2]
        end
    end


    def counts
        count=Hash.new(0)
        self.each {|ele| count[ele]+=1}
        count
    end


    def my_count(target)
        hash=self.counts
        if hash.has_key?(target)
            hash[target]
        else
            0
        end
    end


    def my_index(target)
        self.each_with_index do |ele,idx|
            if target==ele
                return idx
            end
        end
        nil
    end


    def my_uniq
        new_arr=[]
        hash=self.counts
        hash.each do |k,v|
            new_arr<<k
        end
        new_arr
    end

    def my_transpose
        new_arr=Array.new(self[0].length){Array.new(self.length)}
        (0...self.length).each do |i|
            (0...self[i].length).each do |j|
                new_arr[j][i]=self[i][j]
            end
        end
        new_arr
    end


end
