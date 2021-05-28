require_relative 'item'

class List
    attr_accessor :label

    def initialize(label)
       @label=label
       @items=[] 
    end

    def size
        @items.length
    end

    def add_item(title, deadline, description='')
        new_item=Item.new(title,deadline,description)
        if Item.valid_date?(deadline)
            @items<<new_item
            return true
        else
            return false
        end
        
    end

    def valid_index?(idx)
        if idx<0 || idx>@items.length
            return false
        end
        true
    end


    def swap(idx1,idx2)
        if !self.valid_index?(idx1) || !self.valid_index?(idx2)
            return false
        end
         @items[idx1],@items[idx2]=@items[idx2],@items[idx1]
         return true
    end


    def [](idx)
        if self.valid_index?(idx)
            @items[idx]
        else
            nil
        end
    end

    def priority
        @items[0]
    end


    def print
        p '-------------------------------------------------------'
        p @label.upcase
        p '-------------------------------------------------------'
        p 'Index'.ljust(10)+'|'+ 'Item'.ljust(10)+'|'+'Deadline'.ljust(25)+'|'+'Done'
        p '-------------------------------------------------------'
        @items.each_with_index do |item,idx|
            done_str='[ ]'
            if item.done_task==true
                done_str='[✓]'
            end
            p idx.to_s.ljust(10)+'|'+ item.title.ljust(10)+'|'+item.deadline.ljust(25)+'|'+done_str
        end
        p '-------------------------------------------------------'
        return
    end


    def print_full_item(index)
        if self.valid_index?(index)
            done_str='[ ]'
            if @items[index].done_task==true
                done_str='[✓]'
            end
            p '-------------------------------------------------------'
            p @items[index].title.ljust(10)+@items[index].deadline+"|"+done_str
            p @items[index].description
            p '-------------------------------------------------------'
        end
    end

    def print_priority
        done_str='[ ]'
        if @items[index].done_task==true
            done_str='[✓]'
        end
        p '-------------------------------------------------------'
        p @items[0].title.ljust(10)+@items[0].deadline+"|"+done_str
        p @items[0].description
        p '-------------------------------------------------------'
    end


    def up(index, amount=1)
        if self.valid_index?(index)
            times_to_move=[index,amount].min
            i=index
            times_to_move.times do 
                self.swap(i,i-1)
                i-=1
            end
            return true
        else
            return false
        end
    end

    def down(index, amount=1)
        if self.valid_index?(index)
            times_to_move=[ @items.length-index-1 , amount].min
            i=index
            times_to_move.times do 
                self.swap(i,i+1)
                i+=1
            end
            return true
        else
            return false
        end
    end

    def sort_by_date!
        @items.sort_by!{ |item| item.deadline.split("-")[0].to_i }
        @items.sort_by!{ |item| item.deadline.split("-")[1].to_i }
        @items.sort_by!{ |item| item.deadline.split("-")[2].to_i }
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        if self.valid_index?(index)
            @items.delete_at(index)
            return true
        end
        false
    end

    def purge
        @items.each_with_index do |item,idx|
            if item.done_task==true
                self.remove_item(idx)
            end
        end
    end


end