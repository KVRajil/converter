# frozen_string_literal: true

module Dictionary
  def self.fetch
    words = Set.new
    File.open('data/dictionary.txt', 'r') do |f|
      f.each_line do |word|
        words << word.chomp.downcase
      end
    end
    words
  end
end