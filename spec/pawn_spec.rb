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
        it "pieces in path (black)" do
        board = Board.new
        board.board =     [ [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" ","K"," "," "," "," "," "," "],
                            [" ","p"," "," "," "," "," "," "],
                            [" ","k","P"," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "]]
            c_cell = [4,1]
            expect(pawn.possible_moves(black_player, c_cell, board)).to eql([])
        end
        it "blocked path in the beggining position" do
            board = Board.new
            board.board = board.board =     [ [" "," "," "," "," "," "," "," "],
                                            [" "," "," "," "," "," "," "," "],
                                            [" "," "," "," "," "," "," "," "],
                                            [" "," "," "," "," "," "," "," "],
                                            [" "," "," "," ","N"," "," "," "],
                                            [" "," "," "," "," "," "," "," "],
                                            [" "," "," "," ","p"," "," "," "],
                                            [" "," "," "," "," "," "," "," "]]
            c_cell = [6,4]
            expect(pawn.possible_moves(black_player, c_cell, board)).to eql([[5,4]])
        end
    end

end