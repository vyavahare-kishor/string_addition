require 'rspec'
require_relative '../../services/addition_service'

RSpec.describe AdditionService do
  describe 'add numbers of string format' do
    it 'should return 0 for an empty string' do
      expect(AdditionService.new("").call).to eq(0)
    end
  end
end
