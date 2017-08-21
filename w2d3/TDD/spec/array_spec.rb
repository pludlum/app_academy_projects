
require 'rspec'
require 'array.rb'


describe Array do
  describe '#my_uniq' do
    it 'returns an array of uniq elements' do
      expect([1, 2, 1, 3, 3].uniq).to eq([1, 2, 3])
    end
  end

  describe '#two_sum' do
    it 'returns an array of indices of any two elements whose sum is zero' do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4], [2,3]])
    end
  end

  describe "#my_transpose" do
    it 'swaps the rows and columns of a matrix' do
      expect([[0,1,2],[3,4,5],[6,7,8]].my_transpose).to eq([[0,3,6],[1,4,7],[2,5,8]])
    end
  end
end
