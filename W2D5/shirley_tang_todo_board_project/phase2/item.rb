class Item

    attr_accessor :title, :deadline, :description, :done_task

    def self.valid_date?(date)
        date_list=date.split('-')
        if date_list[1].to_i>12 ||date_list[1].to_i<1||date_list[2].to_i>31 || date_list[2].to_i<1
            return false
        end
        true
    end

    def initialize(title, deadline, description)
        @title=title
        @description=description
        @done_task=false
        if Item.valid_date?(deadline)==false
            raise 'invalid date'
        else
            @deadline=deadline
        end
       
        
    end


    def toggle
        @done_task=!@done_task
    end
end