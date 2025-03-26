require 'rspec'
require_relative '../../services/addition_service'

RSpec.describe AdditionService do
  describe 'add numbers of string format' do
    it 'should return 0 for an empty string' do
      expect(AdditionService.new("").call).to eq(0)
    end

    it 'should return single number for a string containing single number' do
      expect(AdditionService.new("1").call).to eq(1)
    end

    it 'should return sum of two numbers for string' do
      expect(AdditionService.new("2,3").call).to eq(5)
    end

    it 'should return sum of n numbers for string' do
      expect(AdditionService.new("1,2,3,4,5,6,7,8,9").call).to eq(45)
    end

    it 'should return sum of n numbers for string separated by comma and newline' do
      expect(AdditionService.new("1,2\n3,4").call).to eq(10)
    end
  end
end
