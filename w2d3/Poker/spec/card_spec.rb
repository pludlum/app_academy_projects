require 'rspec'
require 'card.rb'

describe Card do
  subject(:card) { Card.new(5, :spade) }
  # let(:suits) { [:spade, :club, :heart, :diamond] }
  # let(:types) { [2..14] }

  describe '#initialize' do
    it 'sets card type' do
      # Card.new(5, :spade)
      expect(card.type).to eq(5)
    end

    it 'sets card suit' do
      expect(card.suit).to eq(:spade)
    end
  end

  describe "#display_card" do
    it "returns string representation of card" do
      expect(card.display_card).to eq("[5 : spade]")
    end
  end



end
