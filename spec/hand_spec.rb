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
        let!(:take_cards) {hand.cards[0..1]}
        let!(:new_cards) {[Card.new("5", :spades), Card.new("3", :clubs)]}

        it 'discards specified cards' do
            hand.trade_cards(take_cards, new_cards)
            expect(hand.cards).to_not include(*take_cards)
        end

        it 'takes specified cards' do
            hand.trade_cards(take_cards, new_cards)
            expect(hand.cards).to include(*new_cards)
        end

        it 'raises an error if trade does not result in five cards' do
            expect do
                hand.trade_cards(hand.cards[0..0], new_cards)
            end.to raise_error 'must have five cards'
        end

        it 'raises an error if trade tries to discard unowned card' do
            expect do
                hand.trade_cards([Card.new("10", :hearts)], new_cards[0..0])
            end.to raise_error 'cannot discard unowned card'
        end
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