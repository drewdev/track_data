require 'spec_helper'

describe Traktion::Kitchen::Chef do
  let(:chef) { Traktion::Kitchen::Chef.cook(seasoning, filets) }
  let(:filets) { double(:filets) }
  let(:seasoning) { double(:seasoning) }

  describe '#serve' do
    let(:seasoned) { double(:seasoned) }

    before do
      allow(chef).to receive(:seasoned).and_return(seasoned)
    end

    it 'maps prepare to the seasoned' do
      expect(chef.seasoned).to receive(:map)
      chef.serve
    end
  end

  describe '#seasoned' do
    it 'maps season to the filet' do
      expect(chef.filets).to receive(:map)
      chef.seasoned
    end
  end
end
