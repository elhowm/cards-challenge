require_relative 'base'

module Checkers
  class FourOfAKind < Base
    def bingo?
      faces = cards.map(&:face)
      @kicker_cards = cards.select { |card| faces.count(card.face) == 4 }
      !@kicker_cards.empty?
    end
  end
end
