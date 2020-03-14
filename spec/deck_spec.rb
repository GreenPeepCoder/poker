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

    let(:cards) do
        [double("card", :value => "K", :suit => :spades),
         double("card", :value => "Q", :suit => :spades),
         double("card", :value => "J", :suit => :spades)]
    end

    describe "#initialize" do
        it 'by default, creates a standard 52-card deck' do
            expect(Deck.new.count).to eq(52)
        end

        it 'can be initialized with an array of cards' do
            expect(Deck.new(cards).count).to eq(3)
        end
    end

    let(:deck) do
        Deck.new(cards.dup)
    end

    it 'should not expose its cards' do
        expect(deck).not_to respond_to(:cards)
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