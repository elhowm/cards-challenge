require_relative 'base'

module Checkers
  class Flush < Base
    def bingo?
      suits = cards.map(&:suit)
      @kicker_cards = cards.select { |card| suits.count(card.suit) == 5 }
      !kicker_cards.empty?
    end
  end
end
