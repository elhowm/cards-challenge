require 'spec_helper'

RSpec.describe Checkers::Straight do
  include CardsFactory

  let(:cards) { [] }
  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    context 'when there is straight' do
      let(:cards) { make_cards(*%w(TD JH QD KS AH 4C TC)) }

      it 'calls #consistent? and returns it\'s value' do
        expect(checker).to receive(:consistent?).with([2, 8, 9, 10, 11, 12])
                                                .and_return(true)
        expect(checker.bingo?).to eq(true)
      end
    end

    context 'when there isn\'t straight' do
      let(:cards) { make_cards(*%w(TD JH QD KS 2H 4C TC)) }

      it 'calls #consistent? and returns it\'s value' do
        expect(checker).to receive(:consistent?).with([0, 2, 8, 9, 10, 11])
                                                .and_return(false)
        expect(checker.bingo?).to eq(false)
      end
    end
  end

  describe '#consistent?' do
    context 'when there is straight' do
      let(:card_codes) { [1, 3, 4, 5, 6, 7, 10] }

      it 'returns true' do
        expect(checker.send(:consistent?, card_codes)).to eq(true)
      end
    end

    context 'when there isn\'t straight' do
      let(:card_codes) { [1, 3, 4, 5, 9, 7, 10] }

      it 'returns false' do
        expect(checker.send(:consistent?, card_codes)).to eq(false)
      end
    end
  end
end
