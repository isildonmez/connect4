require_relative '../lib/connect4'

describe Connect4 do
  subject(:game) {Connect4.new}

  describe "#initialize" do
    it "sets board" do
      empty_board = Hash[(1..7).map{ |x| [x, [".", ".", ".", ".", ".", "."]] }]
      expect(game.board).to eq(empty_board)
    end
  end

  # TODO invalid coord
  describe "#check_the_coord" do
    before do
      fake_obj = double
      expect(game).to receive(:gets).and_return(fake_obj)
      expect(fake_obj).to receive(:chomp).and_return("3")
    end

    it "returns 3" do
      expect(game.check_the_coord).to eq(3)
    end
  end

end