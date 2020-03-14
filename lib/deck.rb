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

    def initialize(cards = Deck.all_cards)
        @cards = cards
    end

    def count
        @cards.count
    end

    def take(num)
        raise "not enough cards" if num > count
        @cards.shift(num)
    end

    def return(cards)
        @cards.push(*cards)
    end

end