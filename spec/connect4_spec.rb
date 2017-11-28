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

  describe "#check_if_free" do
    context "if not free space" do
      it "returns false" do
        game.board[2] = [:p1, :p2, :p2, :p2, :p1, :p2]
        expect(game.check_if_free(2, :p1)).to eq(false)
      end
    end

    context "if free space" do
      it "sets board and returns true" do
        game.board[2] = [:p1, :p2, :p2, :p2, ".", "."]
        expect(game.check_if_free(2, :p1)).to eq(true)
        expect(game.board[2][4]).to eq(:p1)
      end
    end
  end

end