class Connect4
  attr_accessor :board

  def initialize()
    @board = Hash[(1..7).map{ |x| [x, [".", ".", ".", ".", ".", "."]] }]
  end

  def rules
    "Welcome to Connect Four game!\n" +
    "Each player should play by turns\n" +
    "and enter a number between 1-7 as the vertical line of your move e.g. 3\n" +
    "The move will be placed on top of that vertical line.\n"
  end

  def check_the_coord(coord)
    coord.between?(1,7) ? true : false
  end

  def check_if_free(coord, player) # true => save into board return true; false: gets.chomp
    horizontal_idx = @board[coord].index(".")
    if horizontal_idx
      @board[coord][horizontal_idx] = player
    else
      return false
    end
    true
  end

  # def visualise
  # end

  # def styling
  # end

  def a_winner?
  end

end

if __FILE__ == $0
  #main logic goes here.
  game = Connect4.new()
  puts rules
  until (turn > 42) || a_winner?
    player = turn.odd? ? :p1 : :p2
    coord = gets.chomp.to_i
    until check_the_coord(coord)
      puts "Please enter a number between 1-7"
      coord = gets.chomp.to_i
    end
    until check_if_free(coord, player)
      puts "Please enter another number between 1-7"
      coord = gets.chomp.to_i
    end

    turn += 1
  end
end




