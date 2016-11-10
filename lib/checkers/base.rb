module Checkers
  class Base
    attr_reader :cards, :kicker_cards

    def initialize(cards)
      @cards = cards
      @kicker_cards = []
    end

    def score
      combinations = Judge::COMBINATIONS
      current = self::class.name.gsub('Checkers::', '')
      combinations.size - combinations.index(current)
    end
  end
end
