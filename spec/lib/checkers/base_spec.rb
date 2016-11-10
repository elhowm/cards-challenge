require 'spec_helper'

RSpec.describe Checkers::Base do
  include CardsFactory

  let(:cards) { [] }
  let(:checker) { described_class.new(cards) }

  describe '#score' do
    context 'when class name is Flush' do
      before do
        expect(described_class).to receive(:name).and_return('Flush')
      end

      it { expect(checker.score).to eq(6) }
    end

    context 'when class name is Pair' do
      before do
        expect(described_class).to receive(:name).and_return('Pair')
      end

      it { expect(checker.score).to eq(2) }
    end
  end
end
