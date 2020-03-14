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

    def ==(other_card)
        @value == other_card.value && @suit == other_card.suit
    end

    def <=>(other_card)
        if other_card == self
            return 0
        elsif other_card.value != @value
            Card.values.index(@value) <=> Card.values.index(other_card.value)
        else
            @suit <=> other_card.suit
        end
    end
end