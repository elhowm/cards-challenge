module Checkers
  class ThreeOfAKind < Base
    def bingo?
      faces = cards.map(&:face)
      faces.any? { |face| faces.count(face) == 3 }
    end
  end
end
