class Card
  attr_accessor :secret, :face

  def initialize(secret) # 1 - 8
    @secret = secret
    @face = nil
  end

  def show
    @face = secret
  end

  def hide
    @face = nil
  end

  
end
