class MaxIntSet
  attr_accessor :store # necessary?
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    store[num] = true
  end

  def remove(num)
    raise "out of bounds" unless is_valid?(num)
    store[num] = false
  end

  def include?(num)
    return false unless is_valid?(num)
    store[num] == true
  end

  private

  def is_valid?(num)
    return false if num > store.length - 1 || num < 0
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num%num_buckets]<<num
  end

  def remove(num)
    return false unless include?(num)
    @store[num%num_buckets].delete(num)
  end

  def include?(num)
    @store[num%num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num%num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # @store[num%num_buckets] << num unless include?(num)
    unless include?(num)
      if count >= num_buckets
        resize!
      end
      @store[num%num_buckets] << num
      @count += 1
    end
  end

  def remove(num)
    return false unless include?(num)
    @store[num%num_buckets].delete(num)
    @count -= 1    
  end

  def include?(num)
    @store[num%num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    # return if count < num_buckets
    old_store = @store.dup
    @store = Array.new(old_store.length * 2) { Array.new }
    # num_buckets.times { @store.concat([]) }
    old_store.each do |bucket|
      bucket.each do |item|
        @store[item % num_buckets] << item
      end
    end
  end
end
