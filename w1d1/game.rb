require_relative 'player'

class Game

  attr_accessor :fragment, :current_player, :previous_player

  def initialize(*players)
    @fragment = ""
    @players = setup_players(players)
    @dictionary = setup
    @current_player = @players.first
    @previous_player = nil
    @losses = setup_losses(@players)
  end

  def setup_players(players)
    players.map do |player|
      Player.new(player)
    end
  end

  def setup_losses(players)
    h = Hash.new(0)
    players.each do |player|
      h[player] = 0
    end
    h
  end

  def setup
    dict = File.readlines("dictionary.txt").map(&:chomp)
    h = Hash.new
    dict.each {|e| h[e] = true}
    h
  end

  def play_round
    until won?
      take_turn(@current_player)
      next_player!
    end
    @losses.each {|k, v| @losses[k] += 1 unless k == @previous_player}
    puts "#{@previous_player.name} won with the word #{@fragment}!"
    @fragment = ""
  end

  def next_player!
    @previous_player = @current_player
    current_idx = @players.find_index(@current_player)
    @current_player = @players[(current_idx + 1) % @players.length]
  end

  def take_turn(player)
    guess = player.guess
    until valid_play?(guess)
      player.alert_invalid_guess
      guess = player.guess
    end
    @fragment << guess
  end

  def won?
    @dictionary[@fragment] == true
  end

  def valid_play?(string)
    return false unless ("a".."z").to_a.include?(string)
    @dictionary.keys.each do |word|
      new_str = @fragment + string
      return true if word[0...new_str.length] == new_str
    end
    false
  end

  def record(player)
    ghost = "GHOST"
    ghost[0...@losses[player]]
  end

  def display_standings
    @losses.each {|k,v| puts "#{k.name} has #{record(k)}"}
  end

  def run
    until @losses.values.any? {|val| val >= 5}
      display_standings
      play_round
    end
    losers = @losses.select {|k,v| v >= 5}
    losers.each do |loser|
      puts "#{loser.first.name} has been eliminated. GHOST"
    end
  end
end
