require_relative 'tictactoe/game'
require_relative 'tictactoe/player'

class TicTacToe
  def initialize
    @game = Game.new
    @status = nil
    @player = Player.new
  end

  def start
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

  def play
    puts 'A Game of Tic Tac Toe!'
    puts ''
    loop do
      puts '  1. Read the rules'
      puts '  2. Play the game'
      puts '  3. Exit the game'
      puts ''
      print '=> What say you? '
      choice = gets.chomp
      case choice
      when '1'
        rules
      when '2'
        start
        restart
      when '3'
        puts '=> Exiting the game...'
      end
      break if choice == '3'
    end
  end
end
