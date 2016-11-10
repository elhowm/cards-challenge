require_relative 'deck'

class Card
  attr_reader :face, :suit

  def initialize(face, suit)
    @face = face
    @suit = suit
  end

  def <=>(another_card)
    self_score = Deck::FACES.index(face)
    another_card_score = Deck::FACES.index(another_card.face)
    self_score <=> another_card_score
  end

  def inspect
    face + suit
  end

  def to_s
    face + suit
  end
end
