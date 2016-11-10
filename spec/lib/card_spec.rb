require 'spec_helper'

RSpec.describe Card do
  describe '#<=>' do
    it '3D < 4D' do
      card_3d = Card.new('3', 'D')
      card_4d = Card.new('4', 'D')
      expect(card_3d <=> card_4d).to eq(-1)
    end

    it '4H < TD' do
      card_4h = Card.new('4', 'H')
      card_td = Card.new('T', 'D')
      expect(card_4h <=> card_td).to eq(-1)
    end

    it 'AD < 4S' do
      card_ad = Card.new('A', 'D')
      card_td = Card.new('4', 'S')
      expect(card_ad <=> card_td).to eq(1)
    end

    it '2H == 2C' do
      card_2h = Card.new('2', 'H')
      card_2c = Card.new('2', 'C')
      expect(card_2h <=> card_2c).to eq(0)
    end
  end

  describe '#inspect' do
    context 'example 1' do
      let(:card) { Card.new('2', 'H') }

      it { expect(card.inspect).to eq('2H') }
    end

    context 'example 2' do
      let(:card) { Card.new('A', 'S') }

      it { expect(card.inspect).to eq('AS') }
    end
  end

  describe '#to_s' do
    context 'example 1' do
      let(:card) { Card.new('2', 'H') }

      it { expect(card.to_s).to eq('2H') }
    end

    context 'example 2' do
      let(:card) { Card.new('K', 'C') }

      it { expect(card.to_s).to eq('KC') }
    end
  end
end
