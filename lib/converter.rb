# frozen_string_literal: true

require 'set'
require_relative 'dictionary'

# Convert phone number to meaningfull word(s) based on available dictionary.
class Converter

  INVALID_DIGITS = %w(0 1)
  TWO_WORDS_SET  = 5
  THREE_LETTER_COMBINATION  = [3, 3, 4]
  DIGIT_CHAR_MAP = {
                      '2' => %w(a b c),
                      '3' => %w(d e f),
                      '4' => %w(g h i),
                      '5' => %w(j k l),
                      '6' => %w(m n o),
                      '7' => %w(p q r s),
                      '8' => %w(t u v),
                      '9' => %w(w x y z)
                  }

  attr_accessor :phone_number,
                :phone_number_words
  attr_reader   :dictionary


  def initialize(phone_number)
    @phone_number       = phone_number
    @phone_number_words = Set.new
    @dictionary         = Dictionary.fetch
  end

  def to_words
    return 'Invalid phone number!' unless phone_number_valid?
    generate_words
  end

  # Validate the phone number
  def phone_number_valid?
    !phone_number.nil? && phone_number.to_s.length ==10 && !contains_one_zero?
  end

  private

  def generate_words
    two_word_combinations   = []
    three_word_combinations = []
    #this will find all the one word combinations
    one_word_combinations = select_meaningful_words(phone_number_chars).to_a

    #this will find all the two words combinations
    # 3+7, 4+6, 5+5, 6+4, 7+3, 10, 3+3+4, 3+4+3, 4+3+3
    TWO_WORDS_SET.times do |index|
      first_word  = select_meaningful_words(phone_number_chars[0..2+index]).to_a
      second_word = select_meaningful_words(phone_number_chars[3+index..9]).to_a
      two_word_combinations << first_word.product(second_word)
    end
    two_word_combinations = two_word_combinations.flatten(1)

    #this will find all the three words combinations
    # 3+3+4, 3+4+3, 4+3+3
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
    phone_number_array.map{|digit|DIGIT_CHAR_MAP[digit]}
  end

  def phone_number_array
    phone_number.to_s.chars
  end

  def contains_one_zero?
    !(invalid_digits & phone_number_array).empty?
  end

end
