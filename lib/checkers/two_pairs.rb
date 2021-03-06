require_relative 'base'

module Checkers
  class TwoPairs < Base
    def bingo?
      faces = cards.map(&:face)
      pairs = faces.select { |face| faces.count(face) == 2 }.uniq
      @kicker_cards = cards.select { |card| pairs.include? card.face }
      pairs.size == 2
    end
  end
end
