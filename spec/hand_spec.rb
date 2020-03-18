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
        let(:royal_flush) do
            Hand.new([
                Card.new("A", :spades),
                Card.new("K", :spades),
                Card.new("Q", :spades),
                Card.new("J", :spades),
                Card.new("10", :spades),
            ])
        end
        
        let(:straight_flush) do
            Hand.new([
                Card.new("8", :spades),
                Card.new("7", :spades),
                Card.new("6", :spades),
                Card.new("5", :spades),
                Card.new("4", :spades),
            ])
        end

        let(:four_of_a_kind) do
            Hand.new([
                Card.new("A", :spades),
                Card.new("A", :hearts),
                Card.new("A", :diamonds),
                Card.new("A", :clubs),
                Card.new("10", :spades),
            ])
        end

        let(:full_house) do
            Hand.new([
                Card.new("A", :spades),
                Card.new("A", :clubs),
                Card.new("K", :spades),
                Card.new("K", :hearts),
                Card.new("K", :diamonds),
            ])
        end

        let(:flush) do
            Hand.new([
                Card.new("4", :spades),
                Card.new("7", :spades),
                Card.new("A", :spades),
                Card.new("2", :spades),
                Card.new("8", :spades),
            ])
        end

        let(:straight) do
            Hand.new([
                Card.new("8", :hearts),
                Card.new("7", :hearts),
                Card.new("6", :diamonds),
                Card.new("5", :clubs),
                Card.new("4", :spades),
            ])
        end

        let(:three_of_a_kind) do
            Hand.new([
                Card.new("A", :spades),
                Card.new("A", :hearts),
                Card.new("A", :diamonds),
                Card.new("2", :clubs),
                Card.new("10", :spades),
            ])
        end

        let(:two_pair) do
            Hand.new([
                Card.new("A", :spades),
                Card.new("A", :hearts),
                Card.new("J", :diamonds),
                Card.new("10", :clubs),
                Card.new("10", :spades),
            ])
        end

        let(:one_pair) do
            Hand.new([
                Card.new("8", :hearts),
                Card.new("8", :hearts),
                Card.new("6", :diamonds),
                Card.new("5", :clubs),
                Card.new("4", :spades),
            ])
        end

        let(:high_card) do
            Hand.new([
                Card.new("A", :hearts),
                Card.new("7", :hearts),
                Card.new("6", :diamonds),
                Card.new("5", :clubs),
                Card.new("4", :spades),
            ])
        end

        let(:hand_ranks) do
            [
                :royal_flush,
                :straight_flush,
                :four_of_a_kind,
                :full_house,
                :flush,
                :straight,
                :three_of_a_kind,
                :two_pair,
                :one_pair,
                :high_card
            ]
        end
        
        let!(:hands) do
            [
                royal_flush,
                straight_flush,
                four_of_a_kind,
                full_house,
                flush,
                straight,
                three_of_a_kind,
                two_pair,
                one_pair,
                high_card
            ]
        end

        describe "rank" do
            it 'should correctly identify the hand rank' do
                hands.each_with_index do |hand, i|
                    expect(hand.rank).to eq(hand_ranks[i])
                end
            end

            context 'when straight' do
                let(:ace_straight) do
                    Hand.new([
                        Card.new("A", :hearts),
                        Card.new("2", :spades),
                        Card.new("3", :hearts),
                        Card.new("4", :hearts),
                        Card.new("5", :hearts)
                    ])
                end

                it 'should allow ace as the low card' do
                    expect(ace_straight.rank).to eq(:straight)
                end
            end
        end

        describe "#<=>" do
            it 'returns 1 for a hand with a higher rank' do
                expect(royal_flush <=> straight_flush).to eq(1)
            end
            
            it 'returns -1 for a hand with a lower rank' do
                expect(straight_flush <=> royal_flush).to eq(-1)
            end
            
            it 'returns 0 for identical hands' do
                expect(straight_flush <=> straight_flush).to eq(0)
            end

            context 'when hands have the same rank (tie breaker)' do
                context 'when royal flush' do
                    let(:hearts_royal_flush) do
                        Hand.new([
                            Card.new("A", :hearts),
                            Card.new("K", :hearts),
                            Card.new("Q", :hearts),
                            Card.new("J", :hearts),
                            Card.new("10", :hearts),
                        ])
                    end

                    let(:spades_royal_flush) do
                        Hand.new([
                            Card.new("A", :spades),
                            Card.new("K", :spades),
                            Card.new("Q", :spades),
                            Card.new("J", :spades),
                            Card.new("10", :spades),
                        ])
                    end

                    it 'comares based on suit' do 
                        expect(:spades_royal_flush <=> :hearts_royal_flush).to eq(1)
                        expect(:hearts_royal_flush <=> :spades_royal_flush).to eq(-1)
                    end
                end
                
                context 'straight flush' do
                    let(:straight_flush_eight) do
                        Hand.new([
                            Card.new("8", :spades),
                            Card.new("7", :spades),
                            Card.new("6", :spades),
                            Card.new("5", :spades),
                            Card.new("4", :spades)
                        ])
                    end
                    
                    let(:straight_flush_nine) do
                        Hand.new([
                            Card.new("9", :spades),
                            Card.new("8", :spades),
                            Card.new("7", :spades),
                            Card.new("6", :spades),
                            Card.new("5", :spades)
                        ])
                    end
                    
                    let(:hearts_flush_nine) do
                        Hand.new([
                            Card.new("9", :hearts),
                            Card.new("8", :hearts),
                            Card.new("7", :hearts),
                            Card.new("6", :hearts),
                            Card.new("5", :hearts)
                        ])
                    end

                    it 'compares based on high card' do
                        expect(:straight_flush_eight <=> :straight_flush_nine).to eq(-1)
                        expect(:straight_flush_nine <=> :straight_flush_eight).to eq(1)
                    end

                    it 'compares based on suit when high card is the same' do
                        expect(:straight_flush_nine <=> :hearts_flush_nine).to eq(1)
                        expect(:hearts_flush_nine <=> :straight_flush_nine).to eq(-1)
                    end
                end

                context 'when four of a kind' do
                end
                
                context 'when two pair' do
                end
                
                context 'when one pair' do
                end
                
                context 'when high card' do
                end
            end
        end

        describe "::winner" do
        end
    end
end