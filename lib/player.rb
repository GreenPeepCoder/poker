class Player

    attr_reader :bankroll, :hand, :current_bet

    include Comparable

    def self.buy_in(bankroll)
    end

    def initialize(bankroll)
        @bankroll = bankroll
        @current_bet = 0
    end

    def deal_in(hand)
        @hand = hand
    end

    def take_bet(total_bet)
        amount = total_bet - @current_bet
        raise "not enough money" if amount > @bankroll
        @current_bet = total_bet
        @bankroll -= amount
        amount
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