module Checkers
  class Base
    attr_reader :cards, :kicker_cards

    def initialize(cards)
      @cards = cards
      @kicker_cards = []
    end

    def score
      combinations = Judge::COMBINATIONS
      combinations.size - combinations.index(self::class.name)
    end
  end
end
