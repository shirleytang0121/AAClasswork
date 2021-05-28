class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
      DICTIONARY.sample
  end

  def initialize
      @secret_word=Hangman.random_word
      @guess_word=Array.new(@secret_word.length,"_")
      @attempted_chars=[]
      @remaining_incorrect_guesses=5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(attempt)
    if @attempted_chars.include?(attempt)
      true
    else
      false
    end
  end

  def get_matching_indices(guess)
    indices=[]
    @secret_word.each_char.with_index do |char,idx|
      if char==guess
        indices<<idx
      end
    end
    indices
  end

  def fill_indices(char,indices)
    indices.each do |idx|
      @guess_word[idx]=char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars<<char
    end
    if @secret_word.include?(char)==false
      @remaining_incorrect_guesses-=1
    else
      fill_indices(char,get_matching_indices(char))
    end
    return true
  end

  def ask_user_for_guess
    p "Enter a char"
    input=gets.chomp
    try_guess(input)
  end


  def win?
    if @guess_word.join("")==@secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses==0
      puts "LOSE"
      return true
    else
      return false
    end
  end


  def game_over?
    if win? || lose?
      p @secret_word
      true
    else
      false
    end
  end


end
