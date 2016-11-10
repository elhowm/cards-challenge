require_relative 'base'

module Checkers
  class HighCard < Base
    def bingo?
      @kicker_cards = cards
      true
    end
  end
end
