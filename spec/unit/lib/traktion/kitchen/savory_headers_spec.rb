require 'spec_helper'

describe Traktion::Kitchen::SavoryHeaders do
  let(:uglies) { ["This Field", "ThatField" ] }
  let(:savory_headers) { Traktion::Kitchen::SavoryHeaders.new(uglies) }

  describe '.from' do
    let(:savories) { [:this_field, :thatfield ] }

    it 'receives the uglies and returns the savory headers' do
      expect(Traktion::Kitchen::SavoryHeaders.from(uglies)).to eq(savories)
    end
  end

  describe '#downcase' do
    let(:downcased) { ['this field', 'thatfield'] }

    it 'downcases each header' do
      expect(savory_headers.downcase.headers).to eq(downcased)
    end
  end

  describe '#underscore' do
    let(:underscored) { ['This_Field', 'ThatField'] }

    it 'replaces whitespace with underscores' do
      expect(savory_headers.underscore.headers).to eq(underscored)
    end
  end

  describe '#symbolize' do
    let(:symbolized) { [:"This Field", :ThatField] }
    it 'symbolizes' do
      expect(savory_headers.symbolize.headers).to eq(symbolized)
    end
  end
end
