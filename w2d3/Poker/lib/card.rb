
class Card
  attr_reader :type, :suit
  FACE_CARDS = {11 => "J", 12 => "Q", 13 => "K", 14 => "A" }
  def initialize(type, suit)
    @type = type
    @suit = suit
  end

  def display_card
    card_number = @type < 11 ? @type.to_s : FACE_CARDS[@type]
    return "[#{card_number} : #{@suit}]"
  end


end
