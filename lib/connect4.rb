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

  def a_winner?
  end

end

if __FILE__ == $0
  #main logic goes here.
  game = Connect4.new()
  puts rules
  puts visual
  until (turn > 42) || a_winner?
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
    turn += 1
  end
end




