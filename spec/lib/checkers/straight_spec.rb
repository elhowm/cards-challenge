require 'spec_helper'

RSpec.describe Checkers::Straight do
  include CardsFactory

  let(:cards) { [] }
  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    context 'when there is straight' do
      let(:cards) { make_cards(*%w(TD JH QD KS AH)) }

      it 'returns true' do
        expect(checker.send(:bingo?)).to eq(true)
      end
    end

    context 'when there isn\'t straight' do
      let(:cards) { make_cards(*%w(TD JH QD KS 2H)) }

      it 'returns false' do
        expect(checker.send(:bingo?)).to eq(false)
      end
    end
  end
end
