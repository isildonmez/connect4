require_relative '../lib/connect4'

describe Connect4 do
  subject(:game) {Connect4.new}

  describe "#initialize" do
    it "sets board" do
      empty_board = Hash[(0..6).map{ |x| [x, [".", ".", ".", ".", ".", "."]] }]
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
        expect(game.check_the_coord(7)).to eq(false)
      end
    end
  end

  describe "#check_if_free" do
    context "if not free space" do
      it "returns false" do
        game.board[2] = ["x", "o", "o", "o", "x", "o"]
        expect(game.check_if_free(2, "x")).to eq(false)
      end
    end

    context "if free space" do
      it "sets board and returns true" do
        game.board[2] = ["x", "o", "o", "o", ".", "."]
        expect(game.check_if_free(2, "x")).to eq(true)
        expect(game.board[2][4]).to eq("x")
      end
    end
  end

  describe "#visual" do
    it "returns a string to visualise" do
      game.board[0] = ["x", "o", "o", "o", ".", "."]
      game.board[5] = [".", "o", ".", "x", "o", "."]
      current_board = ".  .  .  .  .  .  .\n" +
                      ".  .  .  .  .  o  .\n" +
                      "o  .  .  .  .  x  .\n" +
                      "o  .  .  .  .  .  .\n" +
                      "o  .  .  .  .  o  .\n" +
                      "x  .  .  .  .  .  ."
      expect(game.visual).to eq(current_board)
    end
  end

  describe "#style" do
    it "changes x and o's with unicodes" do
      game.board[0] = ["x", "o", ".", ".", ".", "."]
      current_board = ".  .  .  .  .  .  .\n" +
                      ".  .  .  .  .  .  .\n" +
                      ".  .  .  .  .  .  .\n" +
                      ".  .  .  .  .  .  .\n" +
                      "\u263A  .  .  .  .  .  .\n" +
                      "\u263B  .  .  .  .  .  ."
      expect(game.style).to eq(current_board)
    end
  end

  describe "#a_winner" do
    context "when vertical 4-in-a-row" do
      it "returns true" do
        game.board[3][5] = "x"
        game.board[3][4] = "x"
        game.board[3][3] = "x"
        game.board[3][2] = "x"
        expect(game.a_winner?("x")).to eq(true)
      end
    end

    context "when horizontal 5-in-a-row" do
      it "returns true" do
        game.board[0][2] = "o"
        game.board[1][2] = "o"
        game.board[2][2] = "o"
        game.board[3][2] = "o"
        game.board[4][2] = "o"
        expect(game.a_winner?("o")).to eq(true)
      end
    end

    context "when forward diagonal 5-in-a-row" do
      it "returns true" do
        game.board[2][0] = "o"
        game.board[3][1] = "o"
        game.board[4][2] = "o"
        game.board[5][3] = "o"
        game.board[6][4] = "o"
        expect(game.a_winner?("o")).to eq(true)
      end
    end

    context "when backward diagonal 5-in-a-row" do
      it "returns true" do
        game.board[1][5] = "x"
        game.board[2][4] = "x"
        game.board[3][3] = "x"
        game.board[4][2] = "x"
        game.board[5][1] = "x"
        expect(game.a_winner?("x")).to eq(true)
      end
    end

    context "without 4-in-a-row" do
      it "returns false" do
        game.board[3][5] = "x"
        game.board[3][4] = "x"
        game.board[3][3] = "x"
        game.board[3][2] = "o"
        game.board[3][1] = "x"
        expect(game.a_winner?("x")).to eq(false)
      end

      it "returns false" do
        game.board[0][2] = "o"
        game.board[1][2] = "x"
        game.board[2][2] = "o"
        game.board[3][2] = "o"
        game.board[4][2] = "o"
        game.board[5][2] = "o"
        expect(game.a_winner?("o")).to eq(false)
      end

      it "returns false" do
        game.board[1][5] = "."
        game.board[2][4] = "x"
        game.board[3][3] = "x"
        game.board[4][2] = "x"
        game.board[5][1] = "x"
        expect(game.a_winner?("x")).to eq(false)
      end
    end
  end



end
