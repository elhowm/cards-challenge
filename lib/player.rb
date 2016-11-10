class Player
  attr_accessor :score
  attr_reader :name, :hand

  def initialize(name)
    @name = name
  end
end
