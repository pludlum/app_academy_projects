# require_relative "hand.rb"
class Deck
  attr_reader :stack
  def initialize
    @stack = []
    generate_deck
    shuffle_deck!
  end

  def generate_deck
    card_number = (2..14).to_a
    suits = [:spade, :club, :heart, :diamond]
    card_number.each do |number|
      suits.each do |suit|
        @stack << Card.new(number, suit)
      end
    end

  end

  def shuffle_deck!(stack = @stack)
    5.times do |n|
      stack.shuffle!
    end
    stack
  end

  def deal(hand, card_count)

    card_count.times do |card|
      hand.cards << @stack.pop
      #p hand.cards[0]
    end
  end

  def exchange(hand, indices)
    indices.each_with_index do |selection, idx|
      @stack.unshift(hand.cards[selection - idx])
      hand.cards.delete(hand.cards[selection - idx])
      # p hand.cards[idx]
    end
    deal(hand, indices.length)
    p hand.cards
  end

end
