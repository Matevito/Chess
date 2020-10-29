require "./lib/pieces/queen"
require "./lib/player"
require "./lib/board"

describe Queen do
    describe "#possible moves" do
        queen = Queen.new
        white_player = Player.new("1","white")
        black_player = Player.new("2", "black")
        it "returns all the valid moves in a clean board" do
            board = Board.new
            board.board = [ [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," ","Q"," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "]]
            c_cell = [4,4]
            expect(queen.possible_moves(white_player, c_cell, board)).to eql(
                [[3,4],[2,4],[1,4],[0,4],[3,5],[2,6],[1,7],[4,5],
                [4,6],[4,7],[5,5],[6,6],[7,7],[5,4],[6,4],[7,4],
                [5,3],[6,2],[7,1],[4,3],[4,2],[4,1],[4,0],[3,3],[2,2],[1,1],[0,0]])
        end
        it "dont have possible moves in the beggining(black)" do
            board = Board.new
            c_cell = [7,3]
            expect(queen.possible_moves(black_player, c_cell, board)).to eql([])
        end
        it "dont have possible moves in the beggining(white)" do
            board = Board.new
            c_cell = [0,3]
            expect(queen.possible_moves(white_player, c_cell, board)).to eql([])
        end
        it "handles a board with pieces" do
            board = Board.new
            board.board = [  [" "," "," "," "," "," "," "," "],
                            [" "," "," ","p"," "," "," "," "],
                            [" ","q"," "," "," "," "," "," "],
                            [" "," "," "," ","K"," "," "," "],
                            ["t"," "," ","Q"," "," ","T"," "],
                            [" "," "," "," "," "," "," "," "],
                            [" ","p"," ","P"," "," "," "," "],
                            [""," "," "," "," "," "," "," "]]
            c_cell = [4,3]
            expect(queen.possible_moves(white_player, c_cell, board)).to eql([
                [3,3],[2,3],[1,3],[4,4],[4,5],[5,4],[6,5],[7,6],
                [5,3],[5,2],[6,1],[4,2],[4,1],[4,0],[3,2],[2,1]
            ])
        end
    end
end