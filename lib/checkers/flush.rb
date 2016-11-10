require_relative 'base'

module Checkers
  class Flush < Base
    def bingo?
      @kicker_cards = cards
      cards.map(&:suit).uniq.size == 1
    end
  end
end
