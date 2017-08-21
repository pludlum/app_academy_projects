require_relative 'board'
require_relative 'cursor'

class Display

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    (0..7).each do |y|
      if y == @cursor.cursor_pos[0]
        #print each element of the row individually
        (0..7).each do |x|
          # colorize the shit outa this
          print @board.grid[y][x]
        end
      else
        p @board.grid[y]
      end
    end
  end

  def run
    while true
      System 'clear'
      render
      @cursor_pos.get_input
    end
  end

end
