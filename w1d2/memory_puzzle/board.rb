require_relative "card"
require 'set'

class Board
  attr_accessor :cards

  def initialize
    @cards = populate
  end

  # creates an array of 16 cards, 8 pairs
  def populate
    ((1..8).to_a * 2).shuffle
    .map {|num| Card.new(num)}
  end

  def reveal(idx)
    @cards[idx].show
    @cards[idx]
  end

  def render
    [0, 4, 8, 12].each do |idx|
      puts @cards.map(&:face).slice(idx, 4).to_s
    end
  end

  def count
    uniques.length
  end

  def face_ups
    @cards.select { |card| card.face }
  end

  def uniques
    uniques = Set.new

    @cards.each do |card|
      if face_ups.map(&:face).count(card.face) == 1
        uniques << card
      end
    end

    uniques
  end


  def face_down?(idx)
    !@cards[idx].face
  end

end
