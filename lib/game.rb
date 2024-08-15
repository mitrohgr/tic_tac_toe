class Game
  def initialize
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  def display_board
    game_board = ''
    @board.each_with_index do |arr, idx1|
      arr.each_with_index do |elem, idx2|
        if idx2 == arr.length - 1
          game_board.concat(" #{elem}")
        else
          game_board.concat(" #{elem} |")
        end
      end
      game_board.concat("\n")
      next if idx1 == 2

      3.times do |n|
        if n == 2
          game_board.concat('---')
        else
          game_board.concat('---|')
        end
      end
      game_board.concat("\n")
    end
    game_board
  end
end

game = Game.new
puts game.display_board
