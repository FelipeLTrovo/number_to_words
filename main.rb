require_relative './commands/number_to_words'
require 'colorize'


while true do
  puts "\nPlease type an Integer: ".blue
  param = gets.chomp
  cmd = NumberToWords.new(param).call
  puts "\nResult: #{cmd}".green
  puts "\nPress Ctrl + C to exit the program.".red
end