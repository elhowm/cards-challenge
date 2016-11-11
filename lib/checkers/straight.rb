require_relative 'base'

module Checkers
  class Straight < Base
    def bingo?
      converted = cards.map { |card| Deck::FACES.index(card.face) }.sort.uniq
      consistent? converted
    end

    private

    def consistent?(sequence, criteria = 4)
      consistency_score = 0
      sequence.slice(0..-2).each.with_index do |card_code, index|
        if card_code == sequence[index + 1] - 1
          consistency_score += 1
        elsif consistency_score < criteria
          consistency_score = 0
        end
      end
      consistency_score == criteria
    end
  end
end
