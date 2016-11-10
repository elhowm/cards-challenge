module Checkers
  class FullHouse < Base
    def bingo?
      three_of_a_kind? && one_pair?
    end

    private

    def three_of_a_kind?
      faces = cards.map(&:face)
      faces.any? { |face| faces.count(face) == 3 }
    end

    def one_pair?
      faces = cards.map(&:face)
      faces.any? { |face| faces.count(face) == 2 }
    end
  end
end
