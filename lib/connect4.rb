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

  # TODO styling
  def visual
    verticals = @board.values
    horizontals = verticals[0].zip(verticals[1],
                                  verticals[2],
                                  verticals[3],
                                  verticals[4],
                                  verticals[5],
                                  verticals[6]).reverse
    horizontals.map{ |arr| arr.join("  ")}.join("\n")
  end

  def a_winner?(player)
    # vertical 5-in-a-row
    @board.each_value do |vertical|
      for i in 0..1
        return true if [vertical[i], vertical[i+1],
                        vertical[i+2], vertical[i+3],
                        vertical[i+4]].uniq == player
      end
    end

    # horizontal 5-in-a-row
    for i in 0..5
      for j in 0..2
        return true if [@board[j][i], @board[j+1][i],
                        @board[j+2][i], @board[j+3][i],
                        @board[j+4][i]].uniq == player
      end
    end

    # forward diagonal 5-in-a-row
    for i in 0..2
      for j in 0..1
        return true if [@board[i][j], @board[i+1][j+1],
                        @board[i+2][j+2], @board[i+3][j+3],
                        @board[i+4][j+4]].uniq == player
      end
    end

    # backward diagonal 5-in-a-row
    for i in 5..6
      for j in 4..5
        each_diagonal = []
        for k in 0..4
          each_diagonal << @board[i-(j-k)][j-k]
        end
        return true if each_diagonal.uniq == player
      end
    end

    false
  end

end

if __FILE__ == $0
  #main logic goes here.
  game = Connect4.new()
  puts rules
  puts visual
  gameover = false
  turn = 1
  until (turn > 42) && gameover
    player = turn.odd? ? "x" : "o"
    coord = gets.chomp.to_i
    until check_the_coord(coord)
      puts "Please enter a number between 0-6"
      coord = gets.chomp.to_i
    end
    until check_if_free(coord, player)
      puts "Please enter another number between 0-6"
      coord = gets.chomp.to_i
    end
    puts visual
    gameover = true if a_winner?(player)
    turn += 1
  end
end




