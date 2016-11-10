require_relative 'base'
require_relative 'straight'
require_relative 'flush'

module Checkers
  class StraightFlush < Base
    def bingo?
      @kicker_cards = cards
      Straight.new(cards).bingo? && Flush.new(cards).bingo?
    end
  end
end
