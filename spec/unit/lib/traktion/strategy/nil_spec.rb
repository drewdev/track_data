require 'spec_helper'

describe Traktion::Strategy::Nil do
  let(:data) { nil }

  subject { Traktion::Strategy::Nil }

  it 'should respond to parse' do
    expect(subject).to respond_to(:parse).with(1).argument
  end
end
