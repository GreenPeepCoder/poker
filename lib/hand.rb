class Hand

    attr_reader :cards

    def initialize(cards)
        if cards.length < 5
            raise "must have five cards"
        end
        @cards = cards.sort
    end

end