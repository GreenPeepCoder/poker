require 'rspec'
require 'hand'
require 'card'

let(:cards) {[
    Card.new("10", :spades),
    Card.new("5", :hearts),
    Card.new("A", :hearts),
    Card.new("2", :diamonds),
    Card.new("2", :hearts),
]}

subject(:hand) {Hand.new(cards)}

describe Hand do
    describe "#initialize" do
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