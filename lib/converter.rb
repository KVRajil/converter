require 'set'
require_relative 'dictionary'
require_relative 'digit_char_array'

class Converter

  INVALID_DIGITS = %w(0 1)
  TWO_WORDS_SET  = 5
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

    TWO_WORDS_SET.times do |x|
      first_word  = select_meaningful_words(phone_number_chars[0..2+x]).to_a
      second_word = select_meaningful_words(phone_number_chars[3+x..9]).to_a
      two_word_combinations << first_word.product(second_word)
    end
    two_word_combinations = two_word_combinations.flatten(1)

    first_word  = select_meaningful_words(phone_number_chars[0..2]).to_a
    second_word = select_meaningful_words(phone_number_chars[3..5]).to_a
    third_word  = select_meaningful_words(phone_number_chars[6..9]).to_a
    three_word_combinations = first_word.product(second_word, third_word)

    first_word  = select_meaningful_words(phone_number_chars[0..2]).to_a
    second_word = select_meaningful_words(phone_number_chars[3..6]).to_a
    third_word  = select_meaningful_words(phone_number_chars[7..9]).to_a
    three_word_combinations += first_word.product(second_word, third_word)

    first_word  = select_meaningful_words(phone_number_chars[0..3]).to_a
    second_word = select_meaningful_words(phone_number_chars[4..6]).to_a
    third_word  = select_meaningful_words(phone_number_chars[7..9]).to_a
    three_word_combinations += first_word.product(second_word, third_word)

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
