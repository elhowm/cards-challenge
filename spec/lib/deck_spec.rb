require 'spec_helper'

RSpec.describe Deck do
  let(:deck) { Deck.new }
  let!(:memento_cards) { deck.cards.clone }

  describe '#shuffle' do
    it 'shuffles cards in deck' do
      deck.shuffle!
      expect(memento_cards.size).to eq(deck.cards.size)
      expect(memento_cards).not_to eq(deck.cards)
    end
  end

  describe '#take_card' do
    it 'takes first card from deck' do
      expect(deck.take_card).to eq(memento_cards.first)
      expect(deck.cards.size).to eq(memento_cards.size - 1)
    end
  end
end
