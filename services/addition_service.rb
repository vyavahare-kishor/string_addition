class AdditionService
  attr_accessor :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def call
    return 0 if numbers.nil? || numbers.empty?

    delimiter = ",|\n"
    if numbers.start_with?("//")
      delimiter_part, @numbers = numbers.split("\n", 2)
      delimiter = delimiter_part[2..-1]
    end

    @numbers = numbers.split(/#{delimiter}/).map(&:to_i)
    negative_set = numbers.select(&:negative?)
    unless negative_set.empty?
      raise "negative numbers not allowed #{negative_set.join(',')}"
    end

    numbers.reject { |n| n > 1000 }.sum
  end
end
