require_relative 'base'

module Checkers
  class Straight < Base
    def bingo?
      converted = cards.map { |card| Deck::FACES.index(card.face) }.sort
      converted.slice(0..-2)
               .map.with_index { |card, i| card + 1 == converted[i + 1] }
               .reduce(:&)
    end
  end
end
