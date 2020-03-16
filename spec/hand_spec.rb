require 'rspec'
require 'hand'
require 'card'

describe Hand do

    let(:cards) {[
        Card.new("10", :spades),
        Card.new("5", :hearts),
        Card.new("A", :hearts),
        Card.new("2", :diamonds),
        Card.new("2", :hearts),
    ]}

    subject(:hand) {Hand.new(cards)}

    describe "#initialize" do
        it 'accepts cards correctly' do
            expect(hand.cards).to match_array(cards)
        end

        it 'raises an error if not five cards' do
            cards.pop
            expect do
                Hand.new(cards)
            end.to raise_error 'must have five cards'
        end
    end

    describe "#trade_cards" do
    end

    describe "poker hands" do

        describe "rank" do
        end

        describe "#<=>" do
        end

        describe "::winner" do
        end
    end
end