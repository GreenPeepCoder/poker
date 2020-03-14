require 'rspec'
require 'deck'

describe Deck do
    describe "::all_cards" do
        subject(:all_cards) {Deck.all_cards}

        it 'should generate 52 cards' do
            expect(all_cards.count).to eq(52)
        end

        it 'returns all cards without duplicates' do
            expect(
                all_cards.map { |card| [card.value, card.suit]}.uniq.count
            ).to eq(all_cards.count)
        end
    end

    describe "#initialize" do
    end

    describe "#take" do
    end

    describe "#return" do
    end
    
    describe "#shuffle" do
    end

    describe "#deal_hand" do
    end

end