require 'spec_helper'

RSpec.describe Checkers::FullHouse do
  include CardsFactory

  let(:cards) { [] }
  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    context 'when condition becomes true' do
      before do
        expect(checker).to receive(:three_of_a_kind?).and_return(true)
        expect(checker).to receive(:one_pair?).and_return(true)
      end

      it { expect(checker.bingo?).to eq(true) }
    end

    context 'when condition becomes false' do
      before do
        expect(checker).to receive(:three_of_a_kind?).and_return(true)
        expect(checker).to receive(:one_pair?).and_return(false)
      end

      it { expect(checker.bingo?).to eq(false) }
    end
  end

  describe '#three_of_a_kind?' do
    context 'when there are three eq faces' do
      let(:cards) { make_cards(*%w(2D KD TC TS TD)) }

      it { expect(checker.send(:three_of_a_kind?)).to eq(true) }
    end

    context 'when there aren\'t three eq faces' do
      context '(example 1)' do
        let(:cards) { make_cards(*%w(2D TD TC TS TD)) }

        it { expect(checker.send(:three_of_a_kind?)).to eq(false) }
      end

      context '(example 2)' do
        let(:cards) { make_cards(*%w(2D QD 3C TS TD)) }

        it { expect(checker.send(:three_of_a_kind?)).to eq(false) }
      end
    end
  end

  describe '#one_pair?' do
    context 'when there is one pair' do
      let(:cards) { make_cards(*%w(TD TH QD QS QH)) }

      it { expect(checker.send(:one_pair?)).to eq(true) }
    end

    context 'when there isn\'t one pair' do
      context '(example 1)' do
        let(:cards) { make_cards(*%w(TD JH QD KS 2H)) }

        it { expect(checker.send(:one_pair?)).to eq(false) }
      end

      context '(example 2)' do
        let(:cards) { make_cards(*%w(TD TH TC KS 2H)) }

        it { expect(checker.send(:one_pair?)).to eq(false) }
      end
    end
  end
end
