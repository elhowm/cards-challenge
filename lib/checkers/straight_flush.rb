module Checkers
  class StraightFlush < Base
    def bingo?
      Straight.new(cards).bingo? && Flush.new(cards).bingo?
    end
  end
end
