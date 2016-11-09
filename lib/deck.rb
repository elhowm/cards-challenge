require_relative 'card'

class Deck
  attr_reader :cards

  FACES = %w(2 3 4 5 6 7 8 9 T J Q K A).freeze
  SUITS = %w(H S C D).freeze

  def initialize
    @cards =
      SUITS.flat_map do |suit|
        FACES.map do |face|
          Card.new(face, suit)
        end
      end
  end

  def shuffle!
    cards.shuffle!
  end

  def take_card
    cards.shift
  end
end
