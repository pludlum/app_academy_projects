require_relative 'board'
require_relative 'humanPlayer'

class Game
  def initialize(player = HumanPlayer.new)
    @board = Board.new
    @player = player
  end

  def won?
    @board.cards.all? { |card| card.face }
  end

  def play
    @board.render

    until won?
      # get input
      input = @player.prompt(@board)
      @board.reveal(input)
      #player.receive_revealed_card
      @player.receive_revealed_card(@board.cards[input].face, input)
      @board.render
      check_rules
    end

    puts "You're a winner"
  end

  private

  def check_rules
    # if all are face up, game won
    # if 0 uniques ares face up, do nothing
    # if 1 unique is face up, do nothing
    # if 2 uniques are face up, turn face down
    if won?
      return
    elsif @board.count <= 1
      return
    elsif @board.count > 1
      @board.uniques.each(&:hide)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  p 'running game'
  g = Game.new(ComputerPlayer.new)
  g.play
end
