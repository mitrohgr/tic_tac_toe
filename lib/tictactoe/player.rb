# The Player class models the behavior of a single player
# in Tic-tac-toe. It allows the player to start with a
# randomly selected choice between X and O and then allows
# to change the choice along with restarting a player object.
class Player
  attr_reader :choice

  def initialize
    @choice = %w[X O].sample
  end

  def change_choice
    @choice = @choice == 'X' ? 'O' : 'X'
  end

  def restart
    @choice = %w[X O].sample
  end
end
