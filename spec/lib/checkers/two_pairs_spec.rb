require 'spec_helper'

RSpec.describe Checkers::TwoPairs do
  include CardsFactory

  let(:cards) { [] }
  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    context 'when there are two pairs' do
      let(:cards) { make_cards(*%w(2D 2H TC TS AD 4C 3H)) }

      it { expect(checker.send(:bingo?)).to eq(true) }
    end

    context 'when there aren\'t two pairs' do
      context '(example 1)' do
        let(:cards) { make_cards(*%w(2D 2H TC TS TD 4C AH)) }

        it { expect(checker.send(:bingo?)).to eq(false) }
      end

      context '(example 2)' do
        let(:cards) { make_cards(*%w(2D QD 3C TS 9D 4C AH)) }

        it { expect(checker.send(:bingo?)).to eq(false) }
      end
    end
  end
end
