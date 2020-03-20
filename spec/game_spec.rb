require 'rspec'
require 'game'

describe Game do
    subject(:game) {Game.new}

    describe '#initialize' do
        it 'should set up an empty pot' do
            expect(game.pot).to eq(0)
        end
    end

    describe '#deck' do
        it 'should start with a deck' do
            expect(game.deck).to be_a(Deck)
        end

        it 'should start with a full deck' do
            expect(game.deck.count).to eq(52)
        end
    end

    describe '#add_players' do
    end

    describe '#game_over?' do
    end

    describe '#deal_cards' do
    end

    describe '#add_to_pot' do
    end
end