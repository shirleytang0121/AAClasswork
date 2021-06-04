require 'byebug'

def my_uniq(arr)
  new_arr = []
  arr.each do |ele|
    (new_arr << ele) unless new_arr.include?(ele)
  end
  new_arr
end

class Array
  def two_sum
    new_arr = []
    (0...(length - 1)).each do |idx1|
      ((idx1 + 1)...length).each do |idx2|
        new_arr << [idx1, idx2] if (self[idx1] + self[idx2]).zero?
      end
    end
    new_arr
  end
end

def my_transpose(matrix)
  new_matrix = Array.new(matrix.length) { Array.new(matrix[0].length) }
  matrix.each_with_index do |arr, idx1|
    arr.each_with_index do |ele, idx2|
      new_matrix[idx2][idx1] = ele
    end
  end
  new_matrix
end

def stock_picker(arr)
  days = []
  max_diff = 0
  (0...(arr.length - 1)).each do |idx1|
    ((idx1 + 1)...arr.length).each do |idx2|
      diff = arr[idx2] - arr[idx1]
      if diff > max_diff
        max_diff = diff
        days = [idx1, idx2]
      end
    end
  end
  days
end

class TowersOfHanoi
  attr_accessor :tower

  def initialize
    @tower = [[1, 2, 3, 4], [], []]
  end

  def move(movement)
    raise 'position not valid' unless is_valid?(movement)

    starting, ending = movement
    tower[ending].unshift(tower[starting].shift)
  end

  def is_valid?(movement)
    starting, ending = movement
    return false unless movement.all? { |idx| idx.between?(0, 2) }
    return false if starting == ending || tower[starting].length.zero?

    tower[starting].first < tower[ending].first unless tower[ending].empty?
    true
  end

  def won?
    new_tower=tower.dup
    new_tower.shift
    new_tower.any? { |tower| tower==[1,2,3,4] }
  end

end





