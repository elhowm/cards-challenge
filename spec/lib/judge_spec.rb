require 'spec_helper'

RSpec.describe Judge do
  include CardsFactory

  let(:desk) { Desk.new }
  let(:player) { Player.new('TestPlayer') }
  let(:players) { [player] }
  let(:judge) { described_class.new(desk, players) }

  describe '#call_winner' do
    before { expect(judge).to receive(:estimate_scores) }

    context 'when winner founded by checker' do
      before do
        winners = [Player.new('TestPlayer')]
        expect(judge).to receive(:winners_by_checker_score).and_return(winners)
      end

      it { expect(judge.call_winner).to eq('TestPlayer won!') }
    end

    context 'when winner founded by kicker' do
      before do
        expect(judge).to receive(:winners_by_checker_score).and_return([])
        winners = [Player.new('TestPlayer')]
        expect(judge).to receive(:winners_by_kicker_score).and_return(winners)
      end

      it { expect(judge.call_winner).to eq('TestPlayer won!') }
    end

    context 'when there are many winners' do
      before do
        expect(judge).to receive(:winners_by_checker_score).and_return([])
        winners = [Player.new('TestPlayer1'), Player.new('TestPlayer2')]
        expect(judge).to receive(:winners_by_kicker_score).and_return(winners)
      end

      it { expect(judge.call_winner).to eq('TestPlayer1, TestPlayer2 won!') }
    end
  end

  describe '#estimate_scores' do
    it 'checks all combinations' do
      expect(judge).to receive(:bingo?).exactly(9).times
      judge.send(:estimate_scores)
    end
  end

  describe '#bingo?' do
    let(:combination) { 'Pair' }
    let(:checker) { Checkers::Pair }

    context 'when combination bingo' do
      before do
        expect_any_instance_of(checker).to receive(:bingo?).and_return(true)
      end

      it 'sets score and returns true' do
        expect(judge).to receive(:set_score)
        expect(judge.send(:bingo?, combination, player)).to eq(true)
      end
    end

    context 'when combination bingo' do
      before do
        expect_any_instance_of(checker).to receive(:bingo?).and_return(false)
      end

      it 'returns false' do
        expect(judge).not_to receive(:set_score)
        expect(judge.send(:bingo?, combination, player)).to eq(false)
      end
    end
  end

  describe '#set_score' do
    let(:checker) { Checkers::Pair.new([]) }

    before do
      checker.instance_eval { @kicker_cards = ['test'] }
      judge.send(:set_score, player, checker)
    end

    it 'sets checkers and kickers score' do
      expect(player.score).to eq(2)
      expect(player.kicker_card).to eq('test')
    end
  end

  describe '#winners_by_checker_score' do
    let(:players) { 3.times.map { |i| Player.new("Player#{i}") } }

    context 'when there is a highest score player' do
      before do
        players.each.with_index { |player, i| player.score = i }
      end

      it 'returns array with only one winner' do
        expect(judge.send(:winners_by_checker_score)).to eq([players[2]])
      end
    end

    context 'when there are many winners' do
      it 'returns array with only one winner' do
        expect(judge.send(:winners_by_checker_score)).to eq(players)
      end
    end
  end

  describe '#winners_by_kicker_score' do
    let(:players) { 3.times.map { |i| Player.new("Player#{i}") } }

    context 'when there is a highest score player' do
      before do
        cards = make_cards(*%w(TC KH JC))
        players.each.with_index { |player, i| player.kicker_card = cards[i] }
      end

      it 'returns players with the higher card' do
        expect(judge.send(:winners_by_kicker_score, players)).to eq([players[1]])
      end
    end

    context 'when there are many winners' do
      before do
        cards = make_cards(*%w(KC KH JC))
        players.each.with_index { |player, i| player.kicker_card = cards[i] }
      end

      it 'returns players with the higher card' do
        expect(judge.send(:winners_by_kicker_score, players)).to eq(players[0..1])
      end
    end
  end
end
