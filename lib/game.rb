require_relative 'deck'
require_relative 'desk'
require_relative 'judge'
require_relative 'player'

class Game
  attr_accessor :deck, :desk, :judge, :players

  def initialize(players_count = 3)
    @deck = Deck.new
    @desk = Desk.new
    @players = players_count.times.map { |i| Player.new("player#{i}") }
  end

  def play!
    deck.shuffle!
    pre_flop
    flop
    turn
    river
    judge = Judge.new(desk, players)
    puts judge.call_winner
  end

  private

  def pre_flop
    players.each do |player|
      2.times { player.hand << deck.take_card }
      puts "#{player.name} hand: #{player.hand.join(' ')}"
    end
  end

  def flop
    3.times { desk.cards << deck.take_card }
    puts "Table on flop: #{desk.cards.join(' ')}"
  end

  def turn
    desk.cards << deck.take_card
    puts "Table on turn: #{desk.cards.join(' ')}"
  end

  def river
    desk.cards << deck.take_card
    puts "Table on river: #{desk.cards.join(' ')}"
  end
end
