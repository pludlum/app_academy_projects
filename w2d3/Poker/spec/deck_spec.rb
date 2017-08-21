require 'rspec'
require 'deck.rb'
require 'card.rb'

describe Deck do
  subject(:deck){Deck.new}
  let(:hand) {double('hand', 'cards' => [])}
  let(:ex_hand){double('hand', 'cards' => [1,2,3,4,5])}

  describe '#initialize' do
    it 'create an array of 52 card objects' do
      expect(deck.stack.length).to eq(52)
    end
    it "checks if randon item in deck is a card" do

      expect(deck.stack[rand(52)].class).to be(Card.new(3,"spade").class)
    end

  end

  describe '#shuffle_deck!' do
    # it 'uses the #shuffle method' do
    #   allow(deck.stack)
    # end

    it 'randomizes card order' do
      nums = [1, 2, 3, 4, 5, 6, 7, 8]
      expect(deck.shuffle_deck!(nums)).not_to eq([1, 2, 3, 4, 5, 6, 7, 8])
    end
  end

  describe '#deal' do
    it 'deals n cards to a hand' do
      deck.deal(hand, 5)
      expect(hand.cards.length).to eq(5)
    end

    it 'removes n cards from the deck' do
      deck.deal(hand, 5)
      expect(deck.stack.length).to eq(47)
    end
  end

  describe '#exchange' do
    it "exchanges a 1-3 cards form the deck" do
      allow(deck).to receive(:deal)
      deck.exchange(ex_hand, [0,2,4])
    end
    it "removes the correct cards" do
      deck.exchange(ex_hand, [0,2,4])
      expect(ex_hand.cards).not_to include(1)
    end
    it "returns the correct number of cards" do
      deck.exchange(ex_hand, [0,2,4])
      expect(ex_hand.cards.length).to eq(5)
    end
  end
end
