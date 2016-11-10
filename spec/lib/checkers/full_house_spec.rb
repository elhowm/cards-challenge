require 'spec_helper'

RSpec.describe Checkers::FullHouse do
  include CardsFactory

  let(:cards) { [] }
  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    let(:pair) { Checkers::Pair }
    let(:three) { Checkers::ThreeOfAKind }

    context 'when there is full house' do
      before do
        expect_any_instance_of(three).to receive(:bingo?).and_return(true)
        expect_any_instance_of(pair).to receive(:bingo?).and_return(true)
      end

      it { expect(checker.bingo?).to eq(true) }
    end

    context 'when there isn\'t full house' do
      before do
        expect_any_instance_of(three).to receive(:bingo?).and_return(true)
        expect_any_instance_of(pair).to receive(:bingo?).and_return(false)
      end

      it { expect(checker.bingo?).to eq(false) }
    end
  end
end
