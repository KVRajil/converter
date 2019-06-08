# frozen_string_literal: true

require 'set'
require_relative 'dictionary'
require_relative 'digit_char_array'

class Converter

  INVALID_DIGITS = %w(0 1)
  TWO_WORDS_SET  = 5
  THREE_LETTER_COMBINATION  = [3, 3, 4]
  attr_accessor :phone_number,
                :phone_number_words
  attr_reader   :digit_char_map,
                :dictionary


  def initialize(phone_number)
    @phone_number       = phone_number
    @phone_number_words = Set.new
    @dictionary         = Dictionary.fetch
    @digit_char_map     = DigitCharArray.fetch
  end

  def to_words
    return 'Invalid phone number!' unless phone_number_valid?
    generate_words
  end

  def phone_number_valid?
    !phone_number.nil? && phone_number.to_s.length ==10 && !contains_one_zero?
  end

  private

  def generate_words
    two_word_combinations   = []
    one_word_combinations   = []
    three_word_combinations = []

    one_word_combinations = select_meaningful_words(phone_number_chars).to_a

    TWO_WORDS_SET.times do |index|
      first_word  = select_meaningful_words(phone_number_chars[0..2+index]).to_a
      second_word = select_meaningful_words(phone_number_chars[3+index..9]).to_a
      two_word_combinations << first_word.product(second_word)
    end
    two_word_combinations = two_word_combinations.flatten(1)

    THREE_LETTER_COMBINATION.permutation.to_a.uniq.each do |combination|
      words = []
      combination.each_with_index do |_, index|
        starting_index = combination.slice(0,index).inject(0, :+)
        ending_index   = combination.slice(0,index+1).inject(0, :+) - 1
        words << select_meaningful_words(phone_number_chars[starting_index..ending_index]).to_a
      end
      three_word_combinations += words[0].product(words[1], words[2])
    end

    @phone_number_words += one_word_combinations + two_word_combinations + three_word_combinations
    @phone_number_words
  end

  def select_meaningful_words(char_array)
    generate_product(char_array) & dictionary
  end

  def generate_product(char_array)
    char_array.shift.product(*char_array).map(&:join).to_set
  end

  def invalid_digits
    INVALID_DIGITS
  end

  def phone_number_chars
    phone_number_array.map{|digit|digit_char_map[digit]}
  end

  def phone_number_array
    phone_number.to_s.chars
  end

  def contains_one_zero?
    !(invalid_digits & phone_number_array).empty?
  end

end
