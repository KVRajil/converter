# frozen_string_literal: true

require_relative '../lib/converter'

describe Converter do
  let(:phone_number1) { '6686787825' }
  let(:phone_number2) { '2282668687' }
  let(:phone_number3) { '1282668607' }
  let(:words_combinations1) do
    ['motortruck',
     %w[noun struck],
     %w[onto struck],
     %w[motor truck],
     %w[motor usual],
     %w[nouns truck],
     %w[nouns usual],
     %w[mot opt puck],
     %w[mot opt ruck],
     %w[mot opt suck],
     %w[mot ort puck],
     %w[mot ort ruck],
     %w[mot ort suck],
     %w[not opt puck],
     %w[not opt ruck],
     %w[not opt suck],
     %w[not ort puck],
     %w[not ort ruck],
     %w[not ort suck],
     %w[oot opt puck],
     %w[oot opt ruck],
     %w[oot opt suck],
     %w[oot ort puck],
     %w[oot ort ruck],
     %w[oot ort suck],
     %w[mot opts taj],
     %w[mot opus taj],
     %w[mot orts taj],
     %w[not opts taj],
     %w[not opus taj],
     %w[not orts taj],
     %w[oot opts taj],
     %w[oot opus taj],
     %w[oot orts taj],
     %w[noun pup taj],
     %w[noun pur taj],
     %w[noun pus taj],
     %w[noun sup taj],
     %w[noun suq taj],
     %w[onto pup taj],
     %w[onto pur taj],
     %w[onto pus taj],
     %w[onto sup taj],
     %w[onto suq taj]]
  end

  let(:words_combinations2) do
    ['catamounts',
     %w[act amounts],
     %w[act contour],
     %w[bat amounts],
     %w[bat contour],
     %w[cat amounts],
     %w[cat contour],
     %w[acta mounts],
     %w[act boo tots],
     %w[act boo tour],
     %w[act con tots],
     %w[act con tour],
     %w[act coo tots],
     %w[act coo tour],
     %w[bat boo tots],
     %w[bat boo tour],
     %w[bat con tots],
     %w[bat con tour],
     %w[bat coo tots],
     %w[bat coo tour],
     %w[cat boo tots],
     %w[cat boo tour],
     %w[cat con tots],
     %w[cat con tour],
     %w[cat coo tots],
     %w[cat coo tour],
     %w[act boot mus],
     %w[act boot nus],
     %w[act boot our],
     %w[act coot mus],
     %w[act coot nus],
     %w[act coot our],
     %w[bat boot mus],
     %w[bat boot nus],
     %w[bat boot our],
     %w[bat coot mus],
     %w[bat coot nus],
     %w[bat coot our],
     %w[cat boot mus],
     %w[cat boot nus],
     %w[cat boot our],
     %w[cat coot mus],
     %w[cat coot nus],
     %w[cat coot our],
     %w[acta mot mus],
     %w[acta mot nus],
     %w[acta mot our],
     %w[acta not mus],
     %w[acta not nus],
     %w[acta not our],
     %w[acta oot mus],
     %w[acta oot nus],
     %w[acta oot our]]
  end

  context 'Convert given phone number' do
    it 'Check phone number is valid' do
      converter1 = Converter.new(phone_number1)
      expect(converter1.phone_number_valid?).to be(true)
    end

    it 'Check phone number is valid' do
      converter2 = Converter.new(phone_number3)
      expect(converter2.phone_number_valid?).to be(false)
    end

    it 'return all possible words or combinations of words from the provided dictionary' do
      converter3 = Converter.new(phone_number1)
      expect(converter3.to_words).to match_array(words_combinations1)
    end

    it 'return all possible words or combinations of words from the provided dictionary' do
      converter3 = Converter.new(phone_number2)
      expect(converter3.to_words).to match_array(words_combinations2)
    end
  end
end
