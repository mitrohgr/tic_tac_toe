class Game
  def initialize
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  def display_dashes_row(game_board, arr)
    game_board.concat("\t")
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
    game_board.concat("\t")
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

  def check_for_ltr_diagonal?
    ltr_diagonal = @board.length.times.map { |e| @board[e][e] }
    return true if ltr_diagonal.all? { |e| e == 'X' } ||
                   ltr_diagonal.all? { |e| e == 'O' }

    false
  end

  def check_for_rtl_diagonal?
    rtl_diagonal = @board.length.times.map { |e| @board[e][-e - 1] }
    return true if rtl_diagonal.all? { |e| e == 'X' } ||
                   rtl_diagonal.all? { |e| e == 'O' }

    false
  end

  def check_for_diagonals?
    return true if check_for_ltr_diagonal?
    return true if check_for_rtl_diagonal?

    false
  end

  def check_for_columns?
    @board.transpose.each do |arr|
      return true if arr.all? { |e| e == 'X' } ||
                     arr.all? { |e| e == 'O' }
    end
    false
  end

  def check_for_rows?
    @board.each do |arr|
      return true if arr.all? { |e| e == 'X' } ||
                     arr.all? { |e| e == 'O' }
    end
    false
  end

  def won?
    return true if check_for_rows? ||
                   check_for_columns? ||
                   check_for_diagonals?

    false
  end

  def drawn?
    @board.flatten.each do |e|
      return false if e.instance_of? Integer
    end
    true
  end

  def over?
    return true if won? || drawn?

    false
  end

  def restart
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end
end
