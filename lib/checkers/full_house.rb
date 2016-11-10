require_relative 'base'
require_relative 'pair'
require_relative 'three_of_a_kind'

module Checkers
  class FullHouse < Base
    def bingo?
      pair = Checkers::Pair.new(cards).bingo?
      three = Checkers::ThreeOfAKind.new(cards).bingo?
      pair && three
    end
  end
end
