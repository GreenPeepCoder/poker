

module PokerHands
    
    RANKS = [
        :royal_flush,
        :straight_flush,
        :four_of_a_kind,
        :full_house,
        :flush,
        :straight,
        :three_of_a_kind,
        :two_pair,
        :one_pair,
        :high_card
    ]

    def rank
        RANKS.each do |rank|
            return rank if self.send("#{rank}?")
        end
    end

    def <=>
    end
    protected
    def card_value_count(value)
    end

    def high_card
    end

    def cards_without(value)
    end

    def has_a?(value_or_suit)
    end

    def royal?
    end

    def set_card(n)
    end

    private
    def royal_flush?
    end

    def straight_flush?
    end

    def four_of_a_kind?
    end

    def full_house?
    end

    def flush?
    end

    def straight?
    end

    def three_of_a_kind?
    end

    def two_pair?
    end

    def one_pair?
    end

    def high_card?
        true
    end
end