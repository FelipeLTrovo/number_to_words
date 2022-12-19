require_relative '../commands/number_to_words'

describe 'NumberToWords' do
  describe "With valid params" do
    it 'is true' do
      cmd_a = NumberToWords.new('1').call
      cmd_b = NumberToWords.new('21').call
      cmd_c = NumberToWords.new('105').call
      cmd_d = NumberToWords.new('701').call
      cmd_e = NumberToWords.new('1317').call

      expect(cmd_a).to eq('one')
      expect(cmd_b).to eq('twenty one')
      expect(cmd_c).to eq('one hundred and five')
      expect(cmd_d).to eq('seven hundred and one')
      expect(cmd_e).to eq('one thousand, three hundred and seventeen')
    end

    it 'is zero' do
      cmd = NumberToWords.new("0").call

      expect(cmd).to eq("zero")
    end
  end

  describe "With invalid params" do
    it 'is a string' do
      cmd_a = NumberToWords.new("0000").call
      cmd_b = NumberToWords.new("some text").call
      cmd_c = NumberToWords.new("2.5").call

      expect(cmd_a).to eq("invalid parameter")
      expect(cmd_b).to eq("invalid parameter")
      expect(cmd_c).to eq("invalid parameter")
    end
  end
end