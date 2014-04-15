require 'spec_helper'

describe TrackData::FromPlainText do
  let(:from_plain_text) { TrackData::FromPlainText.new(plain_text_pathname) }
  let(:plain_text_pathname) { Pathname.new("spec/fixtures/files/itunes_plain_text.txt") }

  describe '.use' do
    subject { TrackData::FromPlainText.use(plain_text_pathname) }

    it 'returns an instace with the pathname loaded' do
      expect(subject.pathname).to eq(plain_text_pathname)
    end
  end

  describe '#process' do
    subject { from_plain_text.process }
    context 'reads, prepares, and translates successfully' do
      before do
        allow(from_plain_text).to receive(:read).and_return(true)
        allow(from_plain_text).to receive(:prepare).and_return(true)
        allow(from_plain_text).to receive(:translate).and_return(true)
      end

      it 'should be true' do
        expect(subject).to be_true
      end
    end

    context 'reads and prepares successfully with no translation when native' do
      before do
        allow(from_plain_text).to receive(:read).and_return(true)
        allow(from_plain_text).to receive(:prepare).and_return(true)
        allow(from_plain_text).to receive(:translate).and_return(false)
        allow(from_plain_text).to receive(:native?).and_return(true)
      end

      it 'should be true' do
        expect(subject).to be_true
      end
    end

    context 'reads and prepares successfully with no translation and non-native' do
      before do
        allow(from_plain_text).to receive(:read).and_return(true)
        allow(from_plain_text).to receive(:prepare).and_return(true)
        allow(from_plain_text).to receive(:translate).and_return(false)
        allow(from_plain_text).to receive(:native?).and_return(false)
      end

      it 'should be false' do
        expect(subject).to be_false
      end
    end

    context 'reads successfully but does not prepare' do
      before do
        allow(from_plain_text).to receive(:read).and_return(true)
        allow(from_plain_text).to receive(:prepare).and_return(false)
        allow(from_plain_text).to receive(:translate).and_return(false)
        allow(from_plain_text).to receive(:native?).and_return(true)
      end

      it 'should be false' do
        expect(subject).to be_false
      end
    end

    context 'does not read successfully' do
      before do
        allow(from_plain_text).to receive(:read).and_return(false)
        allow(from_plain_text).to receive(:prepare).and_return(true)
        allow(from_plain_text).to receive(:translate).and_return(false)
        allow(from_plain_text).to receive(:native?).and_return(true)
      end

      it 'should be false' do
        expect(subject).to be_false
      end
    end
  end

  describe '#read' do
    let(:reader_double) { double('reader') }
    let(:parsed_result) { double('parsed_result') }

    subject { from_plain_text.read }


    before do
      allow(reader_double).to receive(:parse).and_return(parsed_result)
      allow(from_plain_text).to receive(:reader).and_return(reader_double)
    end

    it 'should be true' do
      expect(subject).to be_true
    end

    it 'assigns the parsed result to raw' do
      subject
      expect(from_plain_text.raw).to eq(parsed_result)
    end
  end

  describe '#prepare' do
    let(:preparer_double) { double('preparor') }
    let(:prepared_result) { double('prepared_result') }

    subject { from_plain_text.prepare }

    before do
      allow(preparer_double).to receive(:serve).and_return(prepared_result)
      allow(from_plain_text).to receive(:preparer).and_return(preparer_double)
    end

    it 'should be true' do
      expect(subject).to be_true
    end

    it 'assigns the prepared result to track_data' do
      subject
      expect(from_plain_text.track_data).to eq(prepared_result)
    end
  end
end
