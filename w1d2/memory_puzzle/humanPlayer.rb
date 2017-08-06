class HumanPlayer
  def prompt(board = nil)
    puts "Guess a row! (between 1 and 4)"
    row = gets.chomp.to_i # 1 - 4
    puts "Guess a column! (between 1 and 4)"
    col = gets.chomp.to_i # 1 - 4
    # 0 - 15
    (row - 1) * 4 + (col - 1)
  end

  def receive_revealed_card(something, thing)

  end

end

class ComputerPlayer
  def initialize
    @seen = Array.new(16, nil)
  end

  def receive_revealed_card(face, idx)
    @seen[idx] = face
  end

  def prompt(board)
    # if 0 uniqs face up && pair exists in @seen && pair not face up
    #   then flip one
    # if 1 uniq face up && pair exists
    # => pick the other , and simultaneously turn the pair in seen to symbol

    @seen.each.with_index do |face, idx|
      if face.is_a?(Fixnum) && board.face_down?(idx) # if num and faceDOWN
        # if we saw both (count is 2 if saw both)
        if pair_exists?(face)
          p '0'
          p idx
          p @seen
          return idx
        end
      end
    end

    if board.count == 1 && pair_exists?(board.uniques.to_a[0].face) # if 1 uniq face up && pair exists
      face = board.uniques.to_a[0].face
      idx = @seen.index(face)
      if board.cards[idx].face.nil?
        p '1'
        p idx
        @seen[@seen.index(face)], @seen[@seen.rindex(face)] = :seen, :seen
        return idx
      else
        p '2'
        p @seen.rindex(face)
        @seen[@seen.index(face)], @seen[@seen.rindex(face)] = :seen, :seen
        return @seen.rindex(face)
      end
    else # return a random face down index
      idx = rand(16)

      idx = rand(16) until @seen[idx].nil?

      p '3'
      p idx

      idx
    end
  end

  def pair_exists?(face)
    @seen.count(face) == 2
  end
end

# [,,,5,,,3,,3,,,7,,,].index(3)
