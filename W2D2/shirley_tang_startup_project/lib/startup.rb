require "employee"

class Startup
    def initialize(name, funding,salaries)
        @name=name
        @funding=funding
        @salaries=salaries
        @employees=[]
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        self.funding>startup.funding
    end

    def hire(name,title)
        if valid_title?(title)
            @employees<<Employee.new(name,title)
        else
            raise_error
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        amount=@salaries[employee.title]
        if @funding>=amount
            employee.pay(amount)
            @funding-=amount
        else
            raise_error
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee) }
    end


    def average_salary
        sum=0
        @employees.each do |employee|
            sum+=@salaries[employee.title]
        end
        sum/@employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding+=startup.funding
        startup.salaries.each do |title, amount|
            if !@salaries.has_key?(title)
              @salaries[title] = amount
            end
          end
          @employees +=startup.employees
          startup.close()

    end




end
