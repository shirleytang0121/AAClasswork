class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    if accumulator==nil
      accumulator=self[0]
    end
    self.each do |ele|
      accumulator=prc.call(accumulator,ele)
    end
    accumulator
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  (2...num).none? {|ele| num%ele==0}
end

def primes(num)
  prime_list=[]
  factor=2
  while num!=prime_list.length
    if is_prime?(factor)
      prime_list<<factor
    end
    factor+=1
  end
  prime_list
    
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num<=0
  
  
  factorials_rec(num-1)<<num*factorials_rec(num-1)[-1]
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash=Hash.new{|hash,key| hash[key]=[]}
    count=Hash.new(0)
    self.each { |ele| count[ele]+=1}
    self .each_with_index do |ele, idx|
      if count[ele]>1
        hash[ele]<<idx
      end
    end
    hash
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    return self if self.length<=1
    all_subs=[]
    (0...self.length-1).each do |i|
      (1..self.length).each do |j|
        all_subs<<self[i...j]
      end
    end
    sys_ele=[]
    all_subs.each do |ele|
      if ele==ele.reverse && ele!="" && ele.length>1
        sys_ele<<ele
      end
    end
    sys_ele
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    return self if self.length<=1
    
    middle=self.length/2

    left_half=self[0...middle]
    right_half=self[middle..-1]

    left=self.merge_sort(&prc)
    right=self.merge_sort(&prc)

    Array.merge(left,right,prc)

  end

  private
  def self.merge(left, right, prc)
    prc ||= Proc.new{|a,b| a<=>b}
    merged_list=[]

   until left.empty? || right.empty?
      if prc.call(left[0],right[0])==-1
        merged_list<<left.shift
      else
        merged_list<<right.shift
      end

   end

    merged_list+left+right
   end
end
