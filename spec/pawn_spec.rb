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
            board.board = [ [" "," "," "," "," "," "," "," "],
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
    describe "#capture_range" do
        it "no possible captures in beggining position" do
            board = Board.new
            c_cell = [1,5]
            expect(pawn.capture_range(white_player, c_cell, board)).to eql ([])
        end
        it "two possible captures" do
            board = Board.new
            board.board = [ [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" ","K"," "," "," "," "," "," "],
                            [" ","p"," "," "," "," "," "," "],
                            ["Q"," ","P"," "," "," "," "," "],
                            [" ","p"," "," "," "," "," "," "],
                            [" "," "," "," "," ","k"," "," "]]
            c_cell = [6,1]
            expect(pawn.capture_range(black_player, c_cell, board)).to eql ([[5,2],[5,0]])
        end
        it "one possible capture in column a" do
            board = Board.new
            board.board = [ [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            ["P","K"," "," "," "," "," "," "],
                            [" ","p"," "," "," "," "," "," "],
                            ["Q"," ","P"," "," "," "," "," "],
                            [" ","p"," "," "," "," "," "," "],
                            [" "," "," "," "," ","k"," "," "]]
            c_cell = [3,0]
            expect(pawn.capture_range(white_player, c_cell, board)).to eql([[4,1]])

        end
    end
end