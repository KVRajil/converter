# frozen_string_literal: true

require 'pry'
require 'benchmark'
require 'prettyprint'

require_relative 'converter'

# Get user input
puts 'Enter a 10 digit phone number'
phone_number = gets.chomp.to_i
words = nil
Benchmark.bm do |bm|
  bm.report { words = Converter.new(phone_number).to_words }
end
pp words
