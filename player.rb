# The class is used to create a new player with name that will be played in the game
class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end
end