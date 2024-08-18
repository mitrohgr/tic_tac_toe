class Player
  attr_reader :choice

  def initialize
    @choice = %w[X O].sample
  end

  def change_choice
    @choice = @choice == 'X' ? 'O' : 'X'
  end
end
