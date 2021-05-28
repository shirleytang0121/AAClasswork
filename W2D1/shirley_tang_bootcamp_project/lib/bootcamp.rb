class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name=name
        @slogan=slogan
        @student_capacity=student_capacity
        @teachers=[]
        @students=[]
        @grades=Hash.new{ |hash, k| hash[k]=[]}
    end

    def name
        @name
    end
    
    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire (teacher_name)
        @teachers<<teacher_name
    end

    def enroll (student_name)
        if @students.length<@student_capacity
            @students<<student_name
            true
        else
            false
        end
    end


    def enrolled?( student_name)
        @students.include?(student_name)
    end


    def student_to_teacher_ratio
        @students.length/@teachers.length
    end


    def add_grade(student_name, grade)
        if @students.include?(student_name)
            @grades[student_name]<<grade
            true
        else
            false
        end
    end

    def num_grades(student_name)
        @grades[student_name].length
    end

    def average_grade(student_name)
        if @students.include?(student_name) && num_grades(student_name)>0
            @grades[student_name].sum/num_grades(student_name)
        else
            nil
        end
    end
  
end
