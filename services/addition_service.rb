class AdditionService
  attr_accessor :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def call
    return 0 if numbers.empty?
  end
end
