module Checkers
  class Base
    attr_reader :cards

    def initialize(cards)
      @cards = cards
    end
  end
end
