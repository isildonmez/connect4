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

  def check_the_coord(coord) # coord, true/false
    coord.between?(1,7) ? true : false
  end

  # def visualise
  # end

  # def styling
  # end

  # def colocate_the_coord(player)
  #   coord = get_the_coord
  #   horizontal_idx = @board[coord].index(".")
  #   # @board[coord][horizontal_idx] = player

  # end

  def check_if_free(horizontal_idx)
    # check if idx == nil
    # check if [coord]idx != "."
  end

  def a_winner?
  end

end

if __FILE__ == $0
  game = Connect4.new()
  puts rules
  coord = gets.chomp.to_i
  until check_the_coord(coord)
    puts "Please enter a number between 1-7"
    coord = gets.chomp.to_i
  end
  #main logic goes here.
end




