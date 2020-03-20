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
        it 'should decrement the players bankroll by the bet amount on the first bet' do
            expect do
                player.take_bet(10)
            end.to change {player.bankroll}.by(-10)
        end

        it 'should decrement the players bankroll by the raise amount' do
            player.take_bet(10)
            expect do
                player.take_bet(20)
            end.to change{player.bankroll}.by(-10)
        end 

        it 'should return the amount deducted' do
            expect(player.take_bet(10)).to eq(10)
        end

        it 'should raise an error if the bet is more than the bankroll' do
            expect do
                player.take_bet(1000)
            end.to raise_error("not enough money")
        end
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