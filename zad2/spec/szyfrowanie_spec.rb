require 'simplecov'
SimpleCov.start

require 'szyfrowanie'
#require_relative '../lib/szyfrowanie'

RSpec.describe 'szyfrowanie.rb' do
  describe '#rot13' do
    it 'should be defined' do
      expect { rot13('testowanie aplikacji') }.not_to raise_error
      expect { rot13([1, 2, 3]) }.to raise_error(NameError)
    end
    it 'returns the correct result' do
      expect(rot13('testowanie aplikacji')).to be_a_kind_of String
      expect(rot13('testowanie aplikacji')).to eq('grfgbjnavr ncyvxnpwv')
      expect(rot13('testowanie aplikacji')).to start_with('g')
      expect(rot13('testowanie aplikacji')).to end_with('v')
      expect(rot13('testowanie aplikacji').length).to eq('testowanie aplikacji'.length)
    end
  end
  describe '#binarny' do
    it 'should be defined' do
      expect { binarny('testowanie aplikacji') }.not_to raise_error
      expect { binarny([1, 2, 3]) }.to raise_error(NameError)
    end
    it 'returns the correct result' do
      expect(binarny('testowanie aplikacji')).to be_a_kind_of String
      expect(binarny('test')).to eq('1110100110010111100111110100')
      expect(binarny('')).to eq('')
      expect(binarny('abc')).to_not eql('2')
      expect(binarny('xyz')).to_not eql('9')
    end
  end
  describe '#rotbin' do
    it 'should be defined' do
      expect { rotbin('testowanie aplikacji') }.not_to raise_error
      expect { rotbin([1, 2, 3]) }.to raise_error(NameError)
    end
    it 'returns the correct result' do
      expect(rotbin('testowanie aplikacji')).to be_a_kind_of String
      expect(rotbin('test')).to eq('1100111111001011001101100111')
      expect((rotbin('testowanie aplikacji').length)).to eq(('testowanie aplikacji'.length)*7)
      expect(rotbin(' ')).to_not be_nil
    end
  end
  describe '#oRot13' do
    it 'should be defined' do
      expect { oRot13('grfgbjnavr ncyvxnpwv') }.not_to raise_error
      expect { oRot13([1, 2, 3]) }.to raise_error(NameError)
    end
    it 'returns the correct result' do
      expect(oRot13('grfgbjnavr ncyvxnpwv')).to be_a_kind_of String
      expect(oRot13('grfgbjnavr ncyvxnpwv')).to eq('testowanie aplikacji')
      expect((oRot13('grfgbjnavr ncyvxnpwv').length)).to eq('testowanie_aplikacji'.length)
    end
  end
  describe '#oBinarny' do
    it 'should be defined' do
      expect { oBinarny('') }.not_to raise_error
      expect { oBinarny('0100000') }.not_to raise_error
      expect { oRot13([1, 2, 3]) }.to raise_error(NameError)
    end
    it 'returns the correct result' do
      expect(oBinarny('1110100110010111100111110100')).to be_a_kind_of String
      expect(oBinarny('1110100110010111100111110100')).to eq('test')
      expect(oBinarny('1110100110010111100111110100')).to_not eql('testt')
      expect((oBinarny('1110100110010111100111110100')).length).to eq('test'.length)
    end
  end
  describe '#oRotbin' do
    it 'should be defined' do
      expect { oBinarny('') }.not_to raise_error
      expect { oBinarny('0100000') }.not_to raise_error
      expect { oRot13([1, 2, 3]) }.to raise_error(NameError)
    end
    it 'returns the correct result' do
      expect(oRotbin('1100111111001011001101100111')).to be_a_kind_of String
      expect(oRotbin('1100111111001011001101100111')).to eq('test')
      expect(oRotbin('0100000')).to eq(' ')
    end
  end
end
