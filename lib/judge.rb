Dir["#{File.dirname(__FILE__)}/checkers/*.rb"].each do |checker|
  require_relative checker
end

class Judge
  attr_reader :desk, :players

  COMBINATIONS = %w(
    StraightFlush FourOfAKind FullHouse Flush
    Straight ThreeOfAKind TwoPairs Pair HighCard
  ).freeze

  def initialize(desk, players)
    @desk = desk
    @players = players
  end

  def call_winner
    estimate_scores
    winners = winners_by_checker_score
    return winner_message(winners) if winners.size == 1
    winners = winners_by_kicker_score(winners)
    winner_message(winners)
  end

  private

  def estimate_scores
    players.each do |player|
      COMBINATIONS.each do |combination|
        break if bingo? combination, player
      end
    end
  end

  def bingo?(combination, player)
    checker_class = eval("Checkers::#{combination}")
    cards = desk.cards + player.hand
    checker = checker_class.new(cards)
    return false unless checker.bingo?
    set_score(player, checker)
    true
  end

  def set_score(player, checker)
    player.score = checker.score
    player.kicker_card = checker.kicker_cards.max
  end

  def winners_by_checker_score
    probably_winner = players.sort_by(&:score).reverse.first
    winner_score = probably_winner.score
    players.select { |player| player.score == winner_score }
  end

  def winners_by_kicker_score(contenders)
    probably_winner = contenders.sort_by(&:kicker_card).reverse.first
    winner_card = probably_winner.kicker_card
    players.select { |player| player.kicker_card == winner_card }
  end

  def winner_message(winners)
    won_by = COMBINATIONS[-winners.first.score]
    "#{winners.map(&:name).join(', ')} won! (#{won_by})"
  end
end
