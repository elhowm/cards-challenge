require 'spec_helper'

RSpec.describe Checkers::HighCard do
  include CardsFactory

  let(:cards) { [] }
  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    context 'example 1' do
      let(:cards) { make_cards(*%w(TS TC AH AD)) }

      it { expect(checker.bingo?).to eq(true) }
    end

    context 'example 2' do
      let(:cards) { make_cards(*%w(TS JC KH AD)) }

      it { expect(checker.bingo?).to eq(true) }
    end
  end
end
