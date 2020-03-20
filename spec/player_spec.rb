require 'rspec'
require 'player'

describe Player do
    subject(:player) {Player.new(100)}

    describe '::buy_in' do
        it 'should create a player' do
            expect(player).to be_a(Player)
        end

        it 'should set the players bankroll' do
            expect(player.bankroll).to eq(100)
        end
    end

    describe '#deal_in' do
        let(:hand) {double('hand')}

        it 'should set the players hand' do
            player.deal_in(hand)
            expect(player.hand).to eq(hand)
        end
    end

    describe '#take_bet' do
    end

    describe '#receive winnings' do
    end

    describe '#return_cards' do
    end

    describe '#fold' do
    end

    describe '#folded?' do
    end
end