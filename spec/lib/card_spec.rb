require 'spec_helper'

RSpec.describe Card do
  describe "#<=>" do
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
end
