require 'spec_helper'

describe TrackData::Kitchen::RawIngredients do
  let(:raw_ingredients) { TrackData::Kitchen::RawIngredients.new(unstructured) }
  let(:unstructured) { [ ["field-1", "field-2"], ["row-1.1", "row-1.2"], [ "row-2.1", "row-2.2"] ] }

  describe '.from' do
    it 'returns an instance of raw ingredients' do
      expect(TrackData::Kitchen::RawIngredients.from(unstructured)).to be_an_instance_of(TrackData::Kitchen::RawIngredients)
    end
  end

  describe '#headers' do
    it 'returns the first row from the unstructured data' do
      expect(raw_ingredients.headers).to eq(unstructured.first)
    end
  end

  describe '#rows' do
    let(:range) { 1..2 }

    it 'returns the rows from the position of unstructurd data defined by the range' do
      allow(raw_ingredients).to receive(:range).and_return(range)
      expect(raw_ingredients).to receive(:range)
      expect(raw_ingredients.rows).to eq(unstructured[range])
    end
  end

  describe '#range' do
    it 'returns an instance of range' do
      expect(raw_ingredients.range).to be_an_instance_of(Range)
    end
  end
end
