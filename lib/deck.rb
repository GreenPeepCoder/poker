require_relative './card'
require_relative './hand'

class Deck
    
    def self.all_cards
        deck = []
        Card::SUITS.each do |suit|
            Card::VALUE_STRINGS.values.each do |value|
                deck << Card.new(value, suit)
            end
        end
        deck
    end

end