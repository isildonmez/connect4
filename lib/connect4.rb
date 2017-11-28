class Connect4
  attr_accessor :board

  def initialize()
    rules
    @board = Hash[(1..42).map{ |x| [x, "."] }]
    styling
  end

  def rules
    puts "Welcome to Connect Four game!"
    puts "Each player should play by turns"
    puts "and enter a number between 1-7 as the vertical line of your move e.g. 3"
    puts "The move will be placed on top of that vertical line."
    puts ""
  end

  def visualise
  end

  def styling
  end

  def get_the_coord
    puts "Please enter a number between 1-7"
    check_the_coord
  end

  def check_the_coord
    coord = gets.chomp.to_i
    until coord.between?(1,7)
      puts "It should be between 1-7 and free."
      puts "Please enter another coordinate:"
      coord = gets.chomp.to_i
    end
    coord
  end

  def colocate_the_coord
  end

  def a_winner?
  end

end

if __FILE__ == $0
  game = TicTacToe.new()
  #main logic goes here.
end