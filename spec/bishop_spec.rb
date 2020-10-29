require "./lib/pieces/bishop"
require "./lib/player"
require "./lib/board"

describe Bishop do
    bishop = Bishop.new
    describe "#possible moves" do
        white_player = Player.new("1","white")
        black_player = Player.new("2", "black")
        it "returns all the valid moves in a clean board" do
            board = Board.new
                board.board = [  [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," ","B"," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "]]
                c_cell = [4,4]
                expect(bishop.possible_moves(white_player, c_cell, board)).to eql([[3,5],[2,6],[1,7],[5,5],[6,6],[7,7],[5,3],[6,2],[7,1],[3,3],[2,2],[1,1],[0,0]])
        end
        it "don't have possible moves in the beggining(white)" do
            board = Board.new
            c_cell = [0,0]
            expect(bishop.possible_moves(white_player, c_cell, board)).to eql([])
        end
        it "don't have possible moves in the beggining(black)" do
            board = Board.new
            c_cell = [7,7]
            expect(bishop.possible_moves(black_player, c_cell, board)).to eql([])
        end
        it "handles a board with pieces" do
            board = Board.new
            board.board = [  [" "," "," "," "," "," "," "," "],
                            [" "," "," ","p"," "," "," "," "],
                            [" ","q"," "," "," "," "," "," "],
                            [" "," "," "," ","K"," "," "," "],
                            [" "," "," ","B",""," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" ","p"," "," "," "," "," "," "],
                            [""," "," "," "," "," "," "," "]]
            c_cell = [4,3]
            expect(bishop.possible_moves(white_player, c_cell, board)).to eql([[5,4],[6,5],[7,6],[5,2],[6,1],[3,2],[2,1]])
        end
    end
end