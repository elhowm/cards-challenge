require 'spec_helper'

RSpec.describe Checkers::Pair do
  include CardsFactory

  let(:cards) { [] }
  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    context 'when there is one pair' do
      let(:cards) { make_cards(*%w(2D 3H TC TS AD 7D 8D)) }

      it { expect(checker.send(:bingo?)).to eq(true) }
    end

    context 'when there isn\'t one pair' do
      context '(example 1)' do
        let(:cards) { make_cards(*%w(2D 3H TC TS TD 7D 8D)) }

        it { expect(checker.send(:bingo?)).to eq(false) }
      end

      context '(example 2)' do
        let(:cards) { make_cards(*%w(2D 9D 9C TS TD 7D 8D)) }

        it { expect(checker.send(:bingo?)).to eq(false) }
      end

      context '(example 3)' do
        let(:cards) { make_cards(*%w(2D 7D 9C TS AD 6D 8D)) }

        it { expect(checker.send(:bingo?)).to eq(false) }
      end

      context '(example 4)' do
        let(:cards) { make_cards(*%w(AH TH JS KD 7C QH 5D)) }

        it { expect(checker.send(:bingo?)).to eq(false) }
      end
    end
  end
end
