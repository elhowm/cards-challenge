class Player
  attr_accessor :score, :kicker_card
  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @hand = []
  end
end
