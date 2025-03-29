class AdditionService
  attr_accessor :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def call
    return 0 if numbers.nil? || numbers.empty?

    delimiter = find_delimiter_and_numbers
    @numbers = numbers.split(/#{delimiter}/).map(&:to_i)
    raise_if_numbers_negative
    numbers.reject { |n| n > 1000 }.sum
  end

  private

  def find_delimiter_and_numbers
    delimiter = ",|\n"
    if @numbers.start_with?("//")
      delimiter_part, @numbers = @numbers.split("\n", 2)
      delimiter = delimiter_part[2..-1]
    end
    delimiter
  end

  def raise_if_numbers_negative
    negative_set = @numbers.select(&:negative?)
    unless negative_set.empty?
      raise "negative numbers not allowed #{negative_set.join(',')}"
    end
  end
end
