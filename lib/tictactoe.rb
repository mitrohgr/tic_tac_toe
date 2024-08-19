require_relative 'tictactoe/game'
require_relative 'tictactoe/player'

class TicTacToe
  def initialize
    @game = Game.new
    @status = nil
    @player = Player.new
  end

  def start_game
    puts @game.display_board
    loop do
      print 'Enter grid number: '
      grid = gets.chomp.to_i
      @game.update_board(@player.choice, grid)
      puts @game.display_board
      if @game.won?
        @status = 'won'
        break
      elsif @game.drawn?
        @status = 'drawn'
        break
      end

      @player.change_choice
    end

    case @status
    when 'won'
      puts "Player #{@player.choice} wins!"
    when 'drawn'
      puts 'Nobody wins!'
    end
  end
end
