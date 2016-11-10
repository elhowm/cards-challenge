require 'spec_helper'

RSpec.describe Checkers::FourOfAKind do
  include CardsFactory

  let(:checker) { described_class.new(cards) }

  describe '#bingo?' do
    context 'when there are four eq faces' do
      let(:cards) { make_cards(*%w(2D AH AD AS AC)) }

      it { expect(checker.bingo?).to eq(true) }
    end

    context 'when there aren\'t four eq faces' do
      let(:cards) { make_cards(*%w(2D AH AD TS AC)) }

      it { expect(checker.bingo?).to eq(false) }
    end
  end
end
