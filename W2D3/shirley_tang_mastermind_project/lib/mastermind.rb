require_relative "code"
require "byebug"

class Mastermind
    def initialize(length)
        @secret_code=Code.random(length)
    end

    def print_matches(code)
        p code.num_exact_matches(@secret_code)
        p code.num_near_matches(@secret_code)
    end

    def ask_user_for_guess
        p 'Enter a code'
        input=gets.chomp
        pegs=Code.from_string(input)
        p pegs.num_exact_matches(@secret_code)
        p pegs.num_near_matches(@secret_code)
        return pegs==@secret_code
    end

end
