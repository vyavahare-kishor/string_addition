class AdditionService
  attr_accessor :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def call
    return 0 if numbers.empty?

    numbers.split(",").map(&:to_i).sum
  end
end
