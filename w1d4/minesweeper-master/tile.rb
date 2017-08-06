
class Tile

  def initialize(secret_val = nil)
    @secret_val = secret_val
    @status = :hidden
    @flagged = false
  end

  def revealed?
    @status == :hidden ? false : true
  end

  def flip
    @status = :revealed
  end

  def flag
    @flagged = true
  end

end
