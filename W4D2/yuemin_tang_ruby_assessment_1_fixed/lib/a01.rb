class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  # **Do NOT use the built-in `Array#sort` or `Array#sort_by` methods in your
  # implementation.**

  def merge_sort(&prc)
    prc ||= Proc.new{ |a,b| a<=>b }
    return self if self.length<=1
    middle=self.length/2

    left= self[0...middle]
    right=self[middle..-1]

    sorted_left= left.merge_sort(&prc)
    sorted_right= right.merge_sort(&prc)

    Array.merge(sorted_left,sorted_right,&prc)
    
  
  end

  private
  def self.merge(left, right, &prc)
    merge_list=[]

    merged = []

    until left.empty? || right.empty?
      if prc.call(left.first, right.first)==-1
        merged << left.shift
      elsif prc.call(left.first, right.first)==0
        merged << left.shift
      else
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    answer=[]
    (0...self.length-1).each do |idx1|
      (idx1+1...self.length).each do |idx2|
        if self[idx1]+self[idx2]==target
          answer<<[idx1,idx2]
        end
      end
    end
    answer
  end
end

class Array
  # Write a method that flattens an array to the specified level. If no level
  # is specified, it should entirely flatten nested arrays.

  # **Do NOT use the built-in `Array#flatten` method in your implementation.**

  # Examples:
  # Without an argument:
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

  # When given 1 as an argument:
  # (Flattens the first level of nested arrays but no deeper)
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]

  def my_flatten(level = nil)
    flattened = []

    self.each do |ele|
      if ele.is_a?(Array) && level != 0
        if level==nil
          flattened+=ele.my_flatten
        else
          flattened+=ele.my_flatten(level-1)
        end
      else
        flattened << ele
      end
    end

    flattened
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns all
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  def symmetric_substrings
    all_subs=[]
    (0...self.length).each do |i|
      (0...self.length).each do |j|
        substr=self[i..j]
        if substr.length>1 && substr==substr.reverse
          all_subs<<substr
        end
      end
    end
    all_subs
  end
end


# Write a method `nth_prime` that returns the nth prime number. You may wish to
# use an `is_prime?` helper method.

def nth_prime(n)
  return nil if n==0
  prime_list=[]
  factor=2
  while prime_list.length<n
    if is_prime?(factor)
      prime_list<<factor
    end
    factor+=1
  end
  return prime_list[-1]

end

def is_prime?(num)
  (2...num).none? { |ele|  num%ele==0}
end

class Array
  # Write an `Array#my_each` method that calls a passed block for each element
  # of the array. 
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index` or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    i=0
    while i<self.length
      prc.call(self[i])
      i+=1
    end
    self
  end
end

class Array
  # Write an `Array#my_select` method that returns an array made up of the
  # elements in the array that return `true` from the given block.
  # **Do NOT use the built-in `Array#select` or `Array#reject` methods in your
  # implementation.**

  def my_select(&prc)
    new_arr=[]
    self.my_each do |ele|
      if prc.call(ele)
        new_arr<<ele
      end
    end
    new_arr
  end
end

