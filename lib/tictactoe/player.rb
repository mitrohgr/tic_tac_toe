class Player
  attr_reader :choice

  def initialize
    @choice = %w[X O].sample
  end
end
