class Player
  attr_reader :char_choice, :grid_choice

  def initialize(char_choice, grid_choice)
    @char_choice = char_choice
    @grid_choice = grid_choice
  end
end
