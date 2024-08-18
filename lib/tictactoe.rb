require_relative 'tictactoe/game'
require_relative 'tictactoe/player'

class TicTacToe
  def initialize
    @game = Game.new
    @player = Player.new
  end

  def start_game
    puts @game.display_board
    print 'Enter grid number: '
    grid = gets.chomp.to_i
    @game.update_board(@player.choice, grid)
    puts @game.display_board
  end
end
