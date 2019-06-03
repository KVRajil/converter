require_relative '../lib/converter'

describe Converter do
  let(:phone_number1) { '6686787825' }
  let(:phone_number2) { '2282668687' }
  let(:phone_number3) { '1282668607' }
  let(:words_combinations1) {['motortruck',
                            ['noun', 'struck'],
                            ['onto', 'struck'],
                            ['motor', 'truck'],
                            ['motor', 'usual'],
                            ['nouns', 'truck'],
                            ['nouns', 'usual'],
                            ['mot', 'opt', 'puck'],
                            ['mot', 'opt', 'ruck'],
                            ['mot', 'opt', 'suck'],
                            ['mot', 'ort', 'puck'],
                            ['mot', 'ort', 'ruck'],
                            ['mot', 'ort', 'suck'],
                            ['not', 'opt', 'puck'],
                            ['not', 'opt', 'ruck'],
                            ['not', 'opt', 'suck'],
                            ['not', 'ort', 'puck'],
                            ['not', 'ort', 'ruck'],
                            ['not', 'ort', 'suck'],
                            ['oot', 'opt', 'puck'],
                            ['oot', 'opt', 'ruck'],
                            ['oot', 'opt', 'suck'],
                            ['oot', 'ort', 'puck'],
                            ['oot', 'ort', 'ruck'],
                            ['oot', 'ort', 'suck'],
                            ['mot', 'opts', 'taj'],
                            ['mot', 'opus', 'taj'],
                            ['mot', 'orts', 'taj'],
                            ['not', 'opts', 'taj'],
                            ['not', 'opus', 'taj'],
                            ['not', 'orts', 'taj'],
                            ['oot', 'opts', 'taj'],
                            ['oot', 'opus', 'taj'],
                            ['oot', 'orts', 'taj'],
                            ['noun', 'pup', 'taj'],
                            ['noun', 'pur', 'taj'],
                            ['noun', 'pus', 'taj'],
                            ['noun', 'sup', 'taj'],
                            ['noun', 'suq', 'taj'],
                            ['onto', 'pup', 'taj'],
                            ['onto', 'pur', 'taj'],
                            ['onto', 'pus', 'taj'],
                            ['onto', 'sup', 'taj'],
                            ['onto', 'suq', 'taj']]}



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
  end

end