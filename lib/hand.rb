class Hand

    attr_reader :cards

    def initialize(cards)
        if cards.length < 5
            raise "must have five cards"
        end
        @cards = cards.sort
    end

    def trade_cards(old_cards, new_cards)
    end


    private
    def take_cards(cards)
        @cards.push(*cards)
    end

    def discard_cards(old_cards)
        old_cards.each { |card| cards.delete(card)}
    end

    def has_cards?(old_cards)
        old_cards.all? {|card| cards.include?(card)}
    end

end