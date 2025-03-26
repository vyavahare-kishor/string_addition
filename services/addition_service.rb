class AdditionService
  attr_accessor :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def call
    return 0 if numbers.empty?

    @numbers = numbers.split(/,|\n/).map(&:to_i)
    negative_set = numbers.select(&:negative?)
    unless negative_set.empty?
      raise "negative numbers not allowed #{negative_set.join(',')}"
    end

    numbers.sum
  end
end
