require_relative '../lib/connect4'

describe Connect4 do
  subject(:game) {Connect4.new}

  describe "#initialize" do
    it "sets board" do
      empty_board = Hash[(1..7).map{ |x| [x, [".", ".", ".", ".", ".", "."]] }]
      expect(game.board).to eq(empty_board)
    end
  end

  describe "#rules" do
    it "returns String" do
      expect(game.rules).to be_is_a(String)
    end
  end

  describe "#check_the_coord" do
    context "with valid coordinate" do
      it "returns true" do
        expect(game.check_the_coord(2)).to eq(true)
      end
    end

    context "with invalid coordinate" do
      it "returns false" do
        expect(game.check_the_coord(0)).to eq(false)
      end
    end
  end

end