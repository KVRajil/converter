require 'pry'
require 'benchmark'
require 'prettyprint'

require 'set'
require_relative 'dictionary'
require_relative 'digit_char_array'
require_relative 'converter'

puts 'Enter a 10 digit phone number'
phone_number = gets.chomp.to_i
words = nil
Benchmark.bm do |bm|
  bm.report { words = Converter.new(phone_number).to_words }
end
pp words
