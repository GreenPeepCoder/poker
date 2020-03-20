class Player

    attr_reader :bankroll

    include Comparable

    def self.buy_in(bankroll)
    end

    def initialize(bankroll)
        @bankroll = bankroll
        @current_bet = 0
    end

    def deal_in(hand)
    end

    def take_bet(total_bet)
    end

    def receive_winnings(amount)
    end

    def return_cards
    end

    def fold
    end

    def folded?
    end
end