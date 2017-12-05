class Connect4
  attr_accessor :board

  def initialize()
    @board = Hash[(0..6).map{ |x| [x, [".", ".", ".", ".", ".", "."]] }]
  end

  def rules
    "Welcome to Connect Four game!\n" +
    "Each player should play by turns\n" +
    "and enter a number between 0-6 as the vertical line of your move e.g. 3\n" +
    "The move will be placed on top of that vertical line.\n"
  end

  def check_the_coord(coord)
    coord.between?(0,6) ? true : false
  end

  def check_if_free(coord, player)
    horizontal_idx = @board[coord].index(".")
    if horizontal_idx
      @board[coord][horizontal_idx] = player
    else
      return false
    end
    true
  end

  def visual
    verticals = @board.values
    horizontals = verticals[0].zip(verticals[1],
                                  verticals[2],
                                  verticals[3],
                                  verticals[4],
                                  verticals[5],
                                  verticals[6]).reverse

    string_to_visualise = horizontals.map{ |arr| arr.join("  ")}.join("\n")
  end

  def style
    styling = visual
    styling.gsub("x", "\u263B").gsub("o", "\u263A")
  end

  def a_winner?(player)
    # vertical 4-in-a-row
    for i in 0..6
      for j in 0..2
        each_vertical = []
        for k in 0..3
          each_vertical << @board[i][j+k]
        end
        return true if each_vertical.uniq == [player]
      end
    end

    # horizontal 4-in-a-row
    for i in 0..5
      for j in 0..3
        each_horizontal = []
        for k in 0..3
          each_horizontal << @board[j+k][i]
        end
        return true if each_horizontal.uniq == [player]
      end
    end

    # forward diagonal 4-in-a-row
    for i in 0..3
      for j in 0..2
        fw_diagonal = []
        for k in 0..3
          fw_diagonal << @board[i+k][j+k]
        end
        return true if fw_diagonal.uniq == [player]
      end
    end

    # backward diagonal 5-in-a-row
    for i in 5..6
      for j in 4..5
        each_diagonal = []
        for k in 0..4
          each_diagonal << @board[i-(j-k)][j-k]
        end
        return true if each_diagonal.uniq == [player]
      end
    end

    false
  end

end

if __FILE__ == $0
  game = Connect4.new()
  puts game.rules
  puts game.visual
  gameover = false
  turn = 1
  until (turn > 42) || gameover
    player = turn.odd? ? "x" : "o"
    coord = gets.chomp.to_i
    until game.check_the_coord(coord)
      puts "Please enter a number between 0-6"
      coord = gets.chomp.to_i
    end
    until game.check_if_free(coord, player)
      puts "Please enter another number between 0-6"
      coord = gets.chomp.to_i
    end
    puts game.style
    gameover = true if game.a_winner?(player)
    turn += 1
  end
  puts "Game is over"
end




