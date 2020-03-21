require_relative "player"
require_relative "deck"

class Game
    attr_reader :players, :pot, :deck

    def initialize
        @pot = 0
        @deck = Deck.new
        @players = []
    end

    def play
        play_round until game_over?
        end_game
    end

    def play_round
        deck.shuffle
        reset_players
        deal_cards
        take_bets
        trade_cards
        take_bets
        end_round
        sleep(4)
        system ("clear")
    end

    def trade_cards
        players.each_with_index do |player, idx|
            next if player.folded?
            print "Player #{}, which cards do you want to trade: "
            puts player.hand
            cards = player.get_cards_to_trade
            deck.return(cards)
            player.trade_cards(cards, deck.take(cards.count))
        end
    end

    def end_round
        show_hands
        puts
        puts "WINNER"
        puts "#{winner.hand} winds $#{pot} with a #{winner.hand.rank}"
        winner.receive_winnings(pot)
        @pot = 0
        return_cards
    end

    def round_over?
        players.count { |player| !player.folded? } <= 1
    end

    def show_hands
        puts "HANDS"
        players.each do |player|
            next if player.folded?
            puts "#{player.hand} (#{player.hand.rank})"
        end
    end

    def winner
        players.max
    end

    def return_cards
        players.each {|player| @deck.return(player.return_cards)}
    end

    def reset_players
        players.each(&:unfold)
    end

    def add_players(num_players, bankrolls)
        num_players.times do
            @players << Player.new(bankrolls)
        end
    end

    def game_over?
        players.count { |player| player.bankroll > 0} <= 1
    end

    def end_game
        puts "The game is over"
    end

    def deal_cards
        @players.each do |player|
            if player.bankroll > 0
                hand = @deck.deal_hand
                player.deal_in(hand)
            end
        end
    end

    def take_bets
        players.each(&:reset_current_bet)
        high_bet = 0
        no_raises = false
        most_recent_better = nil

        until no_raises
            no_raises = true
            players.each_with_index do |player, i|
                next if player.folded?
                break if most_recent_better == player || round_over?

                display_status(i, high_bet)

                begin
                    response = player.respond_bet
                    case response
                    when :call
                        add_to_pot(player.take_bet(high_bet))
                    when :bet
                        raise "not enough money" unless player.bankroll >= high_bet
                        no_raises = false
                        most_recent_better = player
                        bet = player.get_bet
                        raise "bet must be at least #{high_bet}" unless bet >= high_bet
                        rs = player.take_bet(bet)
                        high_bet = bet
                        add_to_pot(rs)
                    when :fold
                        player.fold
                    end
                rescue => error
                    puts "#{error.message}"
                    retry
                end
            end
        end
    end

    def display_status(idx, high_bet)
        puts
        puts "Pot: $#{@pot}"
        puts "High bet: $#{high_bet}"

        players.each_with_index do |player, i|
            puts "Player #{i + 1} has #{player.bankroll}"
        end

        puts
        puts "Current player: #{idx + 1}"
        puts "Player #{idx + 1} has bet: $#{players[idx].current_bet}"
        puts "The bet is at $#{high_bet}"
        puts "Player #{idx + 1}'s hand: #{players[idx].hand}'"
    end

    def add_to_pot(amount)
        @pot += amount
        amount
    end
end

def test
    g = Game.new
    g.add_players(2, 100)
    g.play
end

if __FILE__ == $PROGRAM_NAME
    test
end