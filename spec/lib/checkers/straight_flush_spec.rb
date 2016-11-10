require 'spec_helper'

RSpec.describe Checkers::StraightFlush do
  include CardsFactory

  let(:cards) { [] }
  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    context 'when condition becomes true' do
      it 'returns true' do
        expect(checker).to receive(:suits_equeal?).and_return(true)
        expect(checker).to receive(:faces_consistent?).and_return(true)
        expect(checker.bingo?).to eq(true)
      end
    end

    context 'when condition becomes false' do
      it 'returns false' do
        expect(checker).to receive(:suits_equeal?).and_return(true)
        expect(checker).to receive(:faces_consistent?).and_return(false)
        expect(checker.bingo?).to eq(false)
      end
    end
  end

  describe '#suits_equal?' do
    context 'when suits equal' do
      let(:cards) { make_cards(*%w(2D KD 7D JD TD)) }

      it 'returns true' do
        expect(checker.send(:suits_equal?)).to eq(true)
      end
    end

    context 'when suits isn\'t equal' do
      let(:cards) { make_cards(*%w(2D KD 7D JH TD)) }

      it 'returns false' do
        expect(checker.send(:suits_equal?)).to eq(false)
      end
    end
  end

  describe '#faces_consistent?' do
    context 'when faces consistent' do
      let(:cards) { make_cards(*%w(TD JH QD KS AH)) }

      it 'returns true' do
        expect(checker.send(:faces_consistent?)).to eq(true)
      end
    end

    context 'when faces isn\'t consistent' do
      let(:cards) { make_cards(*%w(TD JH QD KS 2H)) }

      it 'returns false' do
        expect(checker.send(:faces_consistent?)).to eq(false)
      end
    end
  end
end
