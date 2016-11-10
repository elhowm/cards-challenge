require 'spec_helper'

RSpec.describe Checkers::StraightFlush do
  include CardsFactory

  let(:cards) { [] }
  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    let(:flush) { Checkers::Flush }
    let(:straight) { Checkers::Straight }

    context 'when condition becomes true' do
      before do
        expect_any_instance_of(flush).to receive(:bingo?).and_return(true)
        expect_any_instance_of(straight).to receive(:bingo?).and_return(true)
      end

      it { expect(checker.bingo?).to eq(true) }
    end

    context 'when condition becomes false' do
      before do
        expect_any_instance_of(flush).to receive(:bingo?).and_return(false)
        expect_any_instance_of(straight).to receive(:bingo?).and_return(true)
      end

      it { expect(checker.bingo?).to eq(false) }
    end
  end
end
