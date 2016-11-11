require 'spec_helper'

RSpec.describe Checkers::ThreeOfAKind do
  include CardsFactory

  let(:cards) { [] }
  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    context 'when there is three of a kind' do
      let(:cards) { make_cards(*%w(2D KD TC TS TD 4C 5C)) }

      it { expect(checker.send(:bingo?)).to eq(true) }
    end

    context 'when there isn\'t three of a kind' do
      context '(example 1)' do
        let(:cards) { make_cards(*%w(2D TD TC TS TD 4C AC)) }

        it { expect(checker.send(:bingo?)).to eq(false) }
      end

      context '(example 2)' do
        let(:cards) { make_cards(*%w(2D QD 3C TS TD 4C AC)) }

        it { expect(checker.send(:bingo?)).to eq(false) }
      end
    end
  end
end
