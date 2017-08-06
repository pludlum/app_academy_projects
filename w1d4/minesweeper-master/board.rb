require_relative 'tile'

class Board

  attr_accessor :grid

  def setup
    @grid = Array.new(9) { Array.new(9) }
    deck = deck_builder
    until deck.empty?
      @grid.each do |row|
        row.map! { deck.pop }
      end
    end
    @grid
  end

  def initialize
    @grid = setup
  end


  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def deck_builder
    size = @grid.flatten.length
    bomb_count = 10

    deck = Array.new(size - bomb_count) { Tile.new }
    bomb_count.times {deck << Tile.new("bang!")}
    deck.shuffle
  end

end
