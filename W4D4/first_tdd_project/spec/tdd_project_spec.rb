require 'rspec'
require 'tdd_project'

describe 'remove_dups' do
  describe '#my_uniq' do
    subject(:arr) { [1, 2, 3, 3, 4, 4] }
    subject(:arr2) { [1, 2, 3, 2, 1, 4] }

    it 'takes in an array as argument' do
      expect { my_uniq }.to raise_error(ArgumentError)
    end

    it 'should remove duplicates' do
      expect(my_uniq(arr)).to eq([1, 2, 3, 4])
      expect(my_uniq(arr2)).to eq([1, 2, 3, 4])
    end

    it 'should return a new array' do
      expect(my_uniq(arr)).not_to be(arr)
    end
  end
end

describe Array do
  describe '#two_sum' do
    subject(:arr) { [-1, 0, 2, -2, 1] }
    subject(:arr2) { [0, -2, -3, 2, 3] }

    it 'finds pairs of positions where the elements sum to zero' do
      expect(arr2.two_sum).to eq([[1, 3], [2, 4]])
    end

    it 'should return pairs in ascending order' do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end

describe '#my_transpose' do
  subject(:matrix) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
  let(:new_matrix) { [[1, 4, 7], [2, 5, 8], [3, 6, 9]] }

  before(:each) do
    expect(matrix).not_to receive(:transpose)
  end

  it 'should return a 2-d array' do
    expect(my_transpose(matrix).all? { |arr| arr.is_a?(Array) }).to be true
    expect(my_transpose(matrix).is_a?(Array)).to be true
  end

  it 'should return a new matrix containing ele at the same index' do
    expect(my_transpose(matrix)).to eq(new_matrix)
  end
end

describe '#stock_picker' do
  subject(:stock_price) { [12, 5, 13, 8, 50] }
  subject(:stock_price2) { [100, 5, 13, 8, 50] }

  it 'should return a pair of days' do
    expect(stock_picker(stock_price).length).to eq(2)
  end

  it 'should find the most profitable pair of days' do
    expect(stock_picker(stock_price)).to eq([1, 4])
  end

  it 'should buy the stock before you can sell' do
    expect(stock_picker(stock_price2)).to eq([1, 4])
  end
end

describe TowersOfHanoi do
  subject(:my_tower) { TowersOfHanoi.new }
  let(:tower) { my_tower.tower }
  describe '#initialize' do
    it 'should create an array containing three arrays' do
      expect(tower.length).to eq(3)
    end

    it 'first array should contain integers 1-4' do
      expect(tower[0]).to eq([1, 2, 3, 4])
    end

    it 'second and third array should be empty' do
      expect(tower[1].empty?).to eq(true)
      expect(tower[2].empty?).to eq(true)
    end
  end

  describe '#move' do
    context 'given a valid index' do
      it 'should move the first ele from an array to another array' do
        new_tower = [[2, 3, 4], [1], []]
        my_tower.move([0, 1])
        expect(tower).to eq(new_tower)

        new_tower2 = [[2, 3, 4], [], [1]]
        my_tower.move([1, 2])
        expect(tower).to eq(new_tower2)
      end
    end

    context 'given an invalid index' do
      it 'should raise an error if move is not valid' do
        expect { my_tower.move([4, 5]) }.to raise_error('position not valid')
        expect { my_tower.move([1, 1]) }.to raise_error('position not valid')
        expect { my_tower.move([2, 0]) }.to raise_error('position not valid')
      end
    end
  end

  describe '#is_valid?' do
    context 'position is valid' do
      it 'should return true' do
        expect(my_tower.is_valid?([0, 2])).to be true
        expect(my_tower.is_valid?([0, 1])).to be true
      end
    end

    context 'position is invalid' do
      it 'should return false' do
        expect(my_tower.is_valid?([5, 3])).to be false
        expect(my_tower.is_valid?([2, 1])).to be false
      end
    end
  end

  describe '#won?' do
    context 'player won' do
      it 'should return true' do
        tower[0] = []
        tower[1] = [1, 2, 3, 4]
        tower[2] = []
        expect(my_tower.won?).to be true
      end
    end

    context 'player not won' do
        it 'should return false' do
            tower[0] = [2,3,4]
            tower[1] = [1]
            tower[2] = []
            expect(my_tower.won?).to be false
        end
    end


  end
end
