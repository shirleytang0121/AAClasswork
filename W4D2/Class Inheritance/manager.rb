require_relative 'employee.rb'

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss)
        super 
        @employees = []
    end

    def add_employee(employee)
        @employees << employee
    end

    def sum_salary
        sum = 0
        (self.employees).each do |employee|
            if employee.is_a? (Manager)
                sum += employee.sum_salary + employee.salary
            else
                sum += employee.salary
            end
        end
        sum
    end


    def bonus(multiplier)
        self.sum_salary * multiplier
    end

end


Abby = Manager.new("Abby","Wife",2000000,nil)
Ned = Manager.new("Ned", "Fonder",1000000,"Abby")
Daren = Manager.new("Daren", "TA Manager",78000,"Ned")
Shawna = Employee.new("Shawna","TA",12000,"Daren")
David = Employee.new("David","TA",10000,"Daren")

Abby.add_employee(Ned)
Ned.add_employee(Daren)
Daren.add_employee(Shawna)
Daren.add_employee(David)

p Abby.bonus(2)
p Ned.bonus(5)
p Daren.bonus(4)
p David.bonus(3)
