require 'rspec'
require 'card'

describe Card do
    describe "#initialize" do
        subject(:card) {Card.new("A", :spades)}

        it 'sets up a card correctly' do
            expect(card.suit).to eq(:spades)
            expect(card.value).to eq("A")
        end

        it 'raises an error when given invalid suit arg' do
            expect do
                Card.new("J", "hearts")
            end.to raise_error("Invalid card suit")
        end

        it 'raises an error when given invalid value arg' do
            expect do
                Card.new(9, :hearts)
            end.to raise_error("Invalid card value")
        end
    end

    describe "#<=>" do
        it 'should return 0 when cards are the same' do
            expect(Card.new("10", :spades) <=> Card.new("10", :spades)).to eq(0)
        end

        it 'should return 1 when card has higher value'

        it 'should return 1 when card has same value, but higher suit'

        it 'should return -1 when card has lower value'

        it 'should return -1 when card has same value, but lower suit'
    end
end