require "./lib/pieces/pawn"
require "./lib/player"
require "./lib/board"

describe Pawn do
    pawn =  Pawn.new
    white_player = Player.new("1","white")
    black_player = Player.new("2", "black")
    describe "#possible_moves" do
        it "returns all valid moves in a clean path" do
            board = Board.new
            c_cell = [1,3]
            expect(pawn.possible_moves(white_player, c_cell, board)).to eql([[2,3],[3,3]])
        end
    end

end