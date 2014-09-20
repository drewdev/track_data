require 'spec_helper'
require 'tempfile'

describe Traktion::Reader do
  let(:pathname) { Pathname.new('path/to/the/file') }

  describe '.for' do
    subject { Traktion::Reader.for(pathname) }

    it 'returns an instance of Traktion::Reader' do
      expect(subject).to be_an_instance_of Traktion::Reader
    end

    it 'sets the path' do
      expect(subject.pathname).to eq(pathname)
    end
  end

  describe '#use' do
    let(:reader) { Traktion::Reader.new(pathname) }
    let(:strategy) { double('strategy') }

    subject { reader.use(strategy) }

    it 'sets the strategy' do
      subject
      expect(reader.strategy).to eq(strategy)
    end
  end

  describe '#data' do
    let(:file_double) { Tempfile.new('fake.txt') }
    let(:pathname) { Pathname.new(file_double.path) }
    let(:reader) { Traktion::Reader.new(pathname) }

    subject { reader.data }

    it 'reads the file' do
      expect(reader.pathname).to receive(:read)
      subject
    end

    it 'stores and returns the data that was read' do
      expect(subject).to eq(pathname.read)
    end

    after do
      file_double.close
      file_double.unlink
    end
  end

  describe '#parse' do
    let(:reader) { Traktion::Reader.new(pathname) }
    let(:data) { "raw\ttext" }

    subject { reader.parse }

    before do
      allow(reader).to receive(:data).and_return(data)
    end

    it 'calls parse on the strategy' do
      expect(reader.parser).to receive(:parse).with(data)
      subject
    end
  end

  describe '#parser' do
    let(:reader) { Traktion::Reader.new(pathname) }
    let(:strategy) { Traktion::Strategy::PlainText }

    subject { reader.parser }

    context 'with a supplied strategy' do
      before do
        allow(reader).to receive(:strategy).and_return(strategy)
      end

      it 'returns an instance the strategy' do
        expect(subject).to eq(strategy)
      end
    end

    context 'with no supplied strategy' do
      it 'returns a nil strategy' do
        expect(subject).to eq(Traktion::Strategy::Nil)
      end
    end
  end
end
