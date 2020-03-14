class Card
    include Comparable

    SUITS = %i(spades hearts diamonds clubs)

    VALUE_STRINGS = {
        :two => "2",
        :three => "3",
        :four => "4",
        :five => "5",
        :six => "6",
        :seven => "7",
        :eight => "8",
        :nine => "9",
        :ten => "10",
        :jack => "J",
        :queen => "Q",
        :king => "K",
        :ace => "A"
    }

    def self.suits
        SUITS
    end

    def self.values
        VALUE_STRINGS.values
    end
    
    attr_reader :value, :suit

    def initialize(value, suit)
        if VALUE_STRINGS.values.include?(value) == false
            raise "Invalid card value"
        elsif SUITS.include?(suit) == false
            raise "Invalid card suit"
        end
        @value, @suit = value, suit
    end
end