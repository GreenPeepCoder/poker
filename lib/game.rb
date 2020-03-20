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
end