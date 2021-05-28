class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? {|peg| POSSIBLE_PEGS.has_key?(peg.upcase)}
  end

  def self.random(length)
    pegs=["R","G","B","Y"]
    new_pegs=Array.new(length)
    (0...length).each do |i|
      new_pegs[i]=pegs.sample
    end
    new_code=Code.new(new_pegs)
    return new_code
  end

  def self.from_string(str_pegs)
    new_code=Code.new(str_pegs.upcase.split(""))
  end

  def initialize(pegs)
    if !Code.valid_pegs?(pegs)
      raise_error
    else
      @pegs=pegs.map { |peg| peg.upcase}
    end
  end

  def pegs
    @pegs
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count=0
    code.pegs.each_with_index do |el1,idx1|
      @pegs.each_with_index do |el2,idx2|
        if el1==el2 && idx1==idx2
          count+=1
        end
      end
    end
    count
  end


  def num_near_matches(code)
    not_exact_match=[]
    i=0
    while i<code.pegs.length
      if code.pegs[i]!=@pegs[i]
        not_exact_match<<code.pegs[i]
      end
      i+=1
    end

    return not_exact_match.count{|ele| @pegs.include?(ele)}
    

  end


  def ==(code)
    self.num_exact_matches(code)==self.length && code.pegs.length==self.length
  end



end
