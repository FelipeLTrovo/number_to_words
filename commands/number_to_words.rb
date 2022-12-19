require_relative("../constants/units")
require_relative("../constants/tens")
require_relative("../constants/scales")

class NumberToWords

  def initialize(number)
    @number = number
    @array = ''
    @words = ''
  end

  def call
    return 'zero' if @number.to_i.zero?
    convert_number_into_array
    iterate_and_slice_array
    sanitize
  end

  private

  def convert_number_into_array
    @array = @number.to_s.reverse.chars.each_slice(3).map(&:join)
  end

  def iterate_and_slice_array
    @array.reverse.each_with_index do |slice, index|
      get_slice_digits(slice)
      print_scales(index)
      handle_printing(@digits.count)
    end
  end

  def get_slice_digits(slice)
    @digits = slice.reverse.chars
  end

  def print_scales(index)
    @words << ' ' + SCALES[@array.size - index] + ',' if index > 0
  end
end

def handle_printing(number_length)
  case number_length
    when 3
      @words << ' '
      @words << UNITS[@digits[0].to_i]
      @words << ' hundred' unless @digits.include?('0')
      @words << ' and' unless @digits.include?('0')
      if @digits[1] == '1'
        @digits[2] = @digits[2].to_i + 10
      else
      @words << ' '
      @words << TENS[@digits[1].to_i]
      end
      @words << ' '
      @words << UNITS[@digits[2].to_i]
    when 2
      if @digits[0] == '1'
        @digits[1] = @digits[1].to_i + 10
      else
        @words << ' '
        @words << TENS[@digits[0].to_i]
      end
        @words << ' '
        @words << UNITS[@digits[1].to_i]
    else  
        @words << ' '
        @words << UNITS[@digits[0].to_i]
    end
  end

def sanitize
  @words.strip!
end