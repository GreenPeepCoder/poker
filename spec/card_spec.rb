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
    end
end