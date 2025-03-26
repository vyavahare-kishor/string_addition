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

    it 'should return sum of two numbers within string' do
      expect(AdditionService.new("2,3").call).to eq(5)
    end
  end
end
