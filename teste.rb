UNITS = [
    '',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
    'eleven',
    'twelve',
    'thirteen',
    'fourteen',
    'fifteen',
    'sixteen',
    'seventeen',
    'eighteen',
    'nineteen',
].freeze

TENS = [
    '',
    '',
    'twenty',
    'thirty',
    'forty',
    'fifty',
    'sixty',
    'seventy',
    'eighty',
    'ninety',
].freeze

SCALES = [
    '',
    'thousand',
    'million',
    'billion',
    'trillion',
    'quadrillion',
    'quintillion',
    'sextillion',
    'septillion',
    'octillion',
    'nonillion',
    'decillion',
    'undecillion',
    'duodecillion',
    'tredecillion',
    'quatttuor-decillion',
    'quindecillion',
    'sexdecillion',
    'septen-decillion',
    'octodecillion',
    'novemdecillion',
    'vigintillion',
    'centillion',
].freeze

number = 99999999

array = number.to_s.reverse.chars.each_slice(3).map(&:join)

words = ''

array.reverse.each_with_index do |slice, index|
  digits = slice.reverse.chars
  words << ' ' + SCALES[array.size - index] + ',' if index > 0


  if (digits.count == 3)
    words << ' '
    words << UNITS[digits[0].to_i]
    words << ' hundred' if !digits.include?('0')
    words << ' and' if !digits.include?('0')

    if digits[1] == '1'
      digits[2] = digits[2].to_i + 10
    else
    words << ' '
    words << TENS[digits[1].to_i]
    end
    words << ' '
    words << UNITS[digits[2].to_i]
  elsif (digits.count == 2)
    if digits[0] == '1'
      digits[1] = digits[1].to_i + 10
    else
    words << ' '
    words << TENS[digits[0].to_i]
    end
    words << ' '
    words << UNITS[digits[1].to_i]
  else
    words << ' '
    words << UNITS[digits[0].to_i]
  end
end



  #words << SCALES[digits[0].to_i]
  #words << ' '

words = 'zero' if number == 0  

puts words.strip!#.chomp(",")
#puts array