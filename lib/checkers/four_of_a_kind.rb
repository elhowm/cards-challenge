module Checkers
  class FourOfAKind < Base
    def bingo?
      faces = cards.map(&:face)
      faces.any? { |face| faces.count(face) == 4 }
    end
  end
end
