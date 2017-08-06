class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess(fragment)
    puts "#{@name} guess a letter"
    gets.chomp
  end

  def alert_invalid_guess
    puts "Not valid! Guess again."
  end

end
