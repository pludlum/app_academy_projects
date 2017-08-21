# PHASE 2

#Just in case we want to catch certain types of errors,
#we can create a more specific error class by inheriting from StandardError
# view steps 1, 2, 3 below
#

#step 1
class CoffeError < StandardError
end




def convert_to_int(str)

  begin
    # p 'input a number'
    # input = gets.chomp
    Integer(str)
  rescue ArgumentError
    nil
  end

end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)

  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == 'coffee'
    raise CoffeError #step 2, differentiate paths for different errors
  else
    raise StandardError
  end

end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeError #step 3, rescue only these types of errors
    p 'try again asshole'
    retry
  end
end



NOTES raising descriptive errors with conditionals
NB not all errors need to be rescued, below the erros prevent the user from initializing a best friend


class NoName < StandardError
end

class YearsKnown < StandardError
end

class PastTime < StandardError
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    raise NoName.new 'no name given' if name == ''
    @yrs_known = yrs_known
    raise YearsKnown.new 'not enough years bro' if yrs_known <= 5
    @fav_pastime = fav_pastime
    raise PastTime.new 'you dont got hobbies?'if fav_pastime == ''
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
