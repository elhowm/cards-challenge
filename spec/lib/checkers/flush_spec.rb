require 'spec_helper'

RSpec.describe Checkers::Flush do
  include CardsFactory

  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    context 'when there is flush' do
      let(:cards) { make_cards(*%w(2H 5H 9H JH AH)) }

      it { expect(checker.bingo?).to eq(true) }
    end

    context 'when there isn\'t flush' do
      let(:cards) { make_cards(*%w(2H 5H 9S JH AH)) }

      it { expect(checker.bingo?).to eq(false) }
    end
  end
end
