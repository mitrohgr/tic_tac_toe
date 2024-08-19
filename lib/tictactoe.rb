require_relative 'tictactoe/game'
require_relative 'tictactoe/player'

# The TicTacToe class serves as the user interface for
# the multiple games of Tic-tac-toe. This class takes
# in handlers for Game class and Player class and then
# controls them in such a way to allow two players to
# play infinite games of Tic-tac-toe.
class TicTacToe
  def initialize
    @game = Game.new
    @status = nil
    @player = Player.new
  end

  def declare_winner
    puts ''
    case @status
    when 'won'
      puts "=> Yoohoo! Player #{@player.choice} won!"
    when 'drawn'
      puts '=> Boohoo! That is a draw!'
    end
    puts ''
  end

  def start # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    puts ''
    puts @game.display_board
    loop do
      puts ''
      print "[Player #{@player.choice}] grid no: "
      grid = gets.chomp.to_i
      @game.update_board(@player.choice, grid)
      puts ''
      puts @game.display_board
      if @game.won?
        @status = 'won'
        break
      elsif @game.drawn?
        @status = 'drawn'
        break
      else
        @player.change_choice
      end
    end
  end

  def rules
    puts ''
    puts 'RULES: In Tic-tac-toe, two players take turns marking the spaces'
    puts '       in a 3-by-3 grid with X or O. The player who succeeds in'
    puts '       placing three of their marks in a horizontal, vertical, or'
    puts '       diagonal row is the winner.'
    puts ''
    puts 'USAGE: Each player can choose a position in the 3-by-3 grid to'
    puts '       put their character. The ranges allowed are from 1 to 9.'
    puts ''
  end

  def restart
    @game.restart
    @player.restart
  end

  def play # rubocop:disable Metrics/MethodLength
    puts 'A Game of Tic Tac Toe!'
    puts ''
    loop do
      puts '  1. Read the rules'
      puts '  2. Play the game'
      puts '  3. Exit the game'
      puts ''
      print 'What say you? '
      choice = gets.chomp
      case choice
      when '1'
        rules
      when '2'
        start
        declare_winner
        restart
      when '3'
        puts 'Exiting the game...'
      else
        puts ''
      end
      break if choice == '3'
    end
  end
end
