require 'spec_helper'

describe Traktion::Kitchen do
  let(:kitchen) { Traktion::Kitchen.with(data) }
  let(:chef_class) { Traktion::Kitchen::Chef }
  let(:savory_headers_class) { Traktion::Kitchen::SavoryHeaders }
  let(:raw_ingredients_class) { Traktion::Kitchen::RawIngredients }
  let(:data) { double(:data) }

  describe '#headers' do
    let(:headers) { double(:headers) }
    let(:raw) { double(:raw) }

    before do
      allow(raw).to receive(:headers).and_return(headers)
      allow(kitchen).to receive(:raw).and_return(raw)
    end

    it 'returns pretty headers from the raw headers' do
      expect(savory_headers_class).to receive(:from).with(headers)
      kitchen.headers
    end
  end

  describe '#rows' do
    let(:raw) { double(:raw) }

    before do
      allow(kitchen).to receive(:raw).and_return(raw)
    end

    it 'returns the raw rows' do
      expect(raw).to receive(:rows)
      kitchen.rows
    end
  end

  describe '#raw' do
    let(:data) { double(:data) }

    before do
      allow(kitchen).to receive(:data).and_return(data)
    end

    it 'returns a raw structure from the materials' do
      expect(raw_ingredients_class).to receive(:from).with(data)
      kitchen.raw
    end
  end

  describe '#serve' do
    let(:headers) { double(:headers) }
    let(:rows) { double(:rows) }
    let(:chef) { chef_class.new(headers, rows) }

    before do
      allow(kitchen).to receive(:chef).and_return(chef)
    end

    it 'asks the chef to serve the dish' do
      expect(chef).to receive(:serve)
      kitchen.serve
    end
  end

  describe '#chef' do
    let(:headers) { double(:headers) }
    let(:rows) { double(:rows) }

    before do
      allow(kitchen).to receive(:headers).and_return(headers)
      allow(kitchen).to receive(:rows).and_return(rows)
    end

    it 'returns a chef that cooks the headers and rows' do
      expect(chef_class).to receive(:cook).with(headers, rows)
      kitchen.chef
    end
  end
end
