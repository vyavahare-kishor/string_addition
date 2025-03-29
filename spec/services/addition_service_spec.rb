require 'rspec'
require_relative '../../services/addition_service'

RSpec.describe AdditionService do
  subject { described_class.new(numbers).call }

  describe 'add numbers present in single string' do

    context 'when string is empty' do
      let(:numbers) { "" }
      it 'should return 0' do
        expect(subject).to eq(0)
      end
    end

    context 'when string is nil' do
      let(:numbers) { nil }
      it 'should return 0' do
        expect(subject).to eq(0)
      end
    end

    context 'when string is not empty' do
      context 'when string contain a single number' do
        let(:numbers) { "1" }
        it 'should return number itself' do
          expect(subject).to eq(1)
        end
      end

      context 'when string contain n numbers separated by comma char' do
        let(:numbers) { "1,2,3,4,5,6,7,8,9" }
        it 'should return sum of n numbers' do
          expect(subject).to eq(45)
        end
      end

      context 'when string contain n numbers separated by new line char' do
        let(:numbers) { "1\n2\n3\n4" }
        it 'should return sum of n numbers' do
          expect(subject).to eq(10)
        end
      end

      context 'when string contain n numbers separated by comma and new line char' do
        let(:numbers) { "1,2,3\n4,5,6\n7,8,9" }
        it 'should return sum of n numbers' do
          expect(subject).to eq(45)
        end
      end

      context 'when string contains a negative number' do
        let(:numbers) { "1,-2,3" }
        it 'should raise an error with a negative number' do
          expect{subject}.to raise_error(Exception, "negative numbers not allowed -2")
        end
      end

      context 'when string contains n negative numbers' do
        let(:numbers) { "1,-2,-3" }
        it 'should raise an error with comma separated n negative numbers' do
          expect{subject}.to raise_error(Exception, "negative numbers not allowed -2,-3")
        end
      end

      context 'when string contains different delimiter than (,\n)' do
        context 'when string contain single delimiter' do
          let(:numbers) { "//;\n1;2" }
          it 'should return sum of n numbers' do
            expect(subject).to eq(3)
          end
        end

        context 'when string contain multiple delimiters' do
          let(:numbers) { "//;;\n1;;2" }
          it 'should return sum of n numbers' do
            expect(subject).to eq(3)
          end
        end
      end
    end
  end
end
