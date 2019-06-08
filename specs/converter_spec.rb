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

  let(:words_combinations2) { ['catamounts',
                              ['act', 'amounts'],
                              ['act', 'contour'],
                              ['bat', 'amounts'],
                              ['bat', 'contour'],
                              ['cat', 'amounts'],
                              ['cat', 'contour'],
                              ['acta', 'mounts'],
                              ['act', 'boo', 'tots'],
                              ['act', 'boo', 'tour'],
                              ['act', 'con', 'tots'],
                              ['act', 'con', 'tour'],
                              ['act', 'coo', 'tots'],
                              ['act', 'coo', 'tour'],
                              ['bat', 'boo', 'tots'],
                              ['bat', 'boo', 'tour'],
                              ['bat', 'con', 'tots'],
                              ['bat', 'con', 'tour'],
                              ['bat', 'coo', 'tots'],
                              ['bat', 'coo', 'tour'],
                              ['cat', 'boo', 'tots'],
                              ['cat', 'boo', 'tour'],
                              ['cat', 'con', 'tots'],
                              ['cat', 'con', 'tour'],
                              ['cat', 'coo', 'tots'],
                              ['cat', 'coo', 'tour'],
                              ['act', 'boot', 'mus'],
                              ['act', 'boot', 'nus'],
                              ['act', 'boot', 'our'],
                              ['act', 'coot', 'mus'],
                              ['act', 'coot', 'nus'],
                              ['act', 'coot', 'our'],
                              ['bat', 'boot', 'mus'],
                              ['bat', 'boot', 'nus'],
                              ['bat', 'boot', 'our'],
                              ['bat', 'coot', 'mus'],
                              ['bat', 'coot', 'nus'],
                              ['bat', 'coot', 'our'],
                              ['cat', 'boot', 'mus'],
                              ['cat', 'boot', 'nus'],
                              ['cat', 'boot', 'our'],
                              ['cat', 'coot', 'mus'],
                              ['cat', 'coot', 'nus'],
                              ['cat', 'coot', 'our'],
                              ['acta', 'mot', 'mus'],
                              ['acta', 'mot', 'nus'],
                              ['acta', 'mot', 'our'],
                              ['acta', 'not', 'mus'],
                              ['acta', 'not', 'nus'],
                              ['acta', 'not', 'our'],
                              ['acta', 'oot', 'mus'],
                              ['acta', 'oot', 'nus'],
                              ['acta', 'oot', 'our']]}



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