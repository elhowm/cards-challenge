module Checkers
  class StraightFlush
    attr_reader :cards

    def initialize(cards)
      @cards = cards
    end

    def bingo?
      suits_equeal? && faces_consistent?
    end

    private

    def suits_equal?
      cards.map(&:suit).uniq.size == 1
    end

    def faces_consistent?
      converted = cards.map { |card| Deck::FACES.index(card.face) }.sort
      converted.slice(0..-2)
               .map.with_index { |card, i| card + 1 == converted[i + 1] }
               .reduce(:&)
    end
  end
end
