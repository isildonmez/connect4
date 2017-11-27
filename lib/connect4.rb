class Connect4
  attr_accessor :board

  def initialize()
    rules
    @board = Hash[(1..42).map{ |x| [x, "."] }]
    styling
  end

  def rules
  end

  def visualise
  end

  def styling
  end

  def get_the_coord
  end

  def check_the_coord
  end

  def a_winner?
  end

end

if __FILE__ == $0
  game = TicTacToe.new()
  #main logic goes here.
end