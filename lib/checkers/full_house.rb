require_relative 'base'
require_relative 'pair'
require_relative 'three_of_a_kind'

module Checkers
  class FullHouse < Base
    def bingo?
      pair = Checkers::Pair.new(cards)
      three = Checkers::ThreeOfAKind.new(cards)
      bingo = pair.bingo? && three.bingo?
      @kicker_cards = pair.kicker_cards + three.kicker_cards
      bingo
    end
  end
end
