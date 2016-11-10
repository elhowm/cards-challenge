module CardsFactory
  def make_cards(*card_codes)
    card_codes.map do |card_code|
      Card.new(card_code[0], card_code[1])
    end
  end
end
