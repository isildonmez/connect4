require_relative '../lib/connect4'

describe Connect4 do
  subject(:game) {Connect4.new}

  describe "#initialize" do
    it "sets board" do
      empty_board = Hash[(1..42).map{ |x| [x, "."] }]
      expect(game.board).to eq(empty_board)
    end
  end

end