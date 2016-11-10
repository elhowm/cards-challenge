module Checkers
  class Flush < Base
    def bingo?
      cards.map(&:suit).uniq.size == 1
    end
  end
end
