require_relative "player"
require_relative "deck"

class Game
    attr_reader :players, :pot, :deck

    def initialize
        @pot = 0
        @deck = Deck.new
        @players = []
    end

    def add_players(num_players, bankrolls)
        num_players.times do
            @players << Player.new(bankrolls)
        end
    end

    def game_over?
        players.count { |player| player.bankroll > 0} <= 1
    end

    def deal_cards
        @players.each do |player|
            if player.bankroll > 0
                hand = @deck.deal_hand
                player.deal_in(hand)
            end
        end
    end

    def add_to_pot(amount)
        @pot += amount
        amount
    end
end