require 'spec_helper'

shared_examples_for "take card to desk" do |n_times|
  it "takes #{n_times} cards to desk" do
    expect(game.deck).to receive(:take_card).exactly(n_times).times
                                            .and_call_original
    expect(game.desk.cards).to receive(:<<).exactly(n_times).times
                                           .and_call_original
  end
end

RSpec.describe Game do
  let(:game) { Game.new(2) }

  before { game.stub(:puts) }

  describe '#play!' do
    after { game.play! }

    it 'performs all steps of a game' do
      expect(game.deck).to receive(:shuffle!)
      expect(game).to receive(:pre_flop)
      expect(game).to receive(:flop)
      expect(game).to receive(:turn)
      expect(game).to receive(:river)
      expect_any_instance_of(Judge).to receive(:call_winner)
    end
  end

  describe '#pre_flop' do
    after { game.send(:pre_flop) }

    it 'gives 2 cards to each player' do
      game.players.each do |player|
        expect(player).to receive(:hand).exactly(3).times.and_call_original
      end

      take_times = game.players.count * 2
      expect(game.deck).to receive(:take_card).exactly(take_times).times
                                              .and_call_original
    end
  end

  describe '#flop' do
    after { game.send(:flop) }

    it_behaves_like 'take card to desk', 3
  end

  describe '#turn' do
    after { game.send(:turn) }

    it_behaves_like 'take card to desk', 1
  end

  describe '#river' do
    after { game.send(:river) }

    it_behaves_like 'take card to desk', 1
  end
end
