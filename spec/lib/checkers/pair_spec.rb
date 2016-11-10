require 'spec_helper'

RSpec.describe Checkers::Pair do
  include CardsFactory

  let(:cards) { [] }
  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    context 'when there is one pair' do
      let(:cards) { make_cards(*%w(2D 3H TC TS AD)) }

      it { expect(checker.send(:bingo?)).to eq(true) }
    end

    context 'when there isn\'t one pair' do
      context '(example 1)' do
        let(:cards) { make_cards(*%w(2D 3H TC TS TD)) }

        it { expect(checker.send(:bingo?)).to eq(false) }
      end

      context '(example 2)' do
        let(:cards) { make_cards(*%w(2D 9D 9C TS TD)) }

        it { expect(checker.send(:bingo?)).to eq(false) }
      end

      context '(example 3)' do
        let(:cards) { make_cards(*%w(2D 7D 9C TS AD)) }

        it { expect(checker.send(:bingo?)).to eq(false) }
      end
    end
  end
end
