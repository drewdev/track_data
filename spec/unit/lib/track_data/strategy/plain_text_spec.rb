require 'spec_helper'

describe TrackData::Strategy::PlainText do
  describe '#parse' do
    let(:plain_text) { "row1:col1\trow1:col2\rrow2:col1\trow2:col2" }
    let(:strategy) { TrackData::Strategy::PlainText.new(plain_text) }

    subject { strategy.parse }

    it 'converts a plain text string into a two-dimensional array' do
      expect(subject).to be_an_instance_of Array
      expect(subject.first).to be_an_instance_of Array
    end
  end
end
