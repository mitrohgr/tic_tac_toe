class Game
  def initialize
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  def display_dashes_row(game_board, arr)
    arr.length.times do |n|
      if n == arr.length - 1
        game_board.concat('---')
      else
        game_board.concat('---|')
      end
    end
    game_board.concat("\n")
  end

  def display_chars(game_board, elem)
    if elem.instance_of? Integer
      game_board.concat('   ')
    else
      game_board.concat(" #{elem} ")
    end
  end

  def display_numbers_row(game_board, arr)
    arr.each_with_index do |elem, idx2|
      display_chars(game_board, elem)
      game_board.concat('|') unless idx2 == arr.length - 1
    end
    game_board.concat("\n")
  end

  def display_board
    game_board = ''
    @board.each_with_index do |arr, idx1|
      display_numbers_row(game_board, arr)
      break if idx1 == @board.length - 1

      display_dashes_row(game_board, arr)
    end
    game_board
  end

  def update_board(choice, grid)
    @board.each do |arr|
      arr.each_with_index do |elem, idx|
        arr[idx] = choice if elem == grid
      end
    end
  end
end
