require "./lib/pieces/tower"
require "./lib/player"
require "./lib/board"

describe Tower do
    describe "#possible moves" do
        tower = Tower.new
        white_player = Player.new("1","white")
        black_player = Player.new("2", "black")
        it "returns all the valid moves in a clean board" do
            board = Board.new
            board.board = [  [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," ","T"," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "]]
            c_cell = [4,4]
            expect(tower.possible_moves(white_player, c_cell, board)).to eql([[4,5],[4,6],[4,7],[4,3],[4,2],[4,1],[4,0],[5,4],[6,4],[7,4],[3,4],[2,4],[1,4],[0,4]])
        end
        it "dont have possible moves in the beggining(white)" do
            board = Board.new
            c_cell = [0,0]
            expect(tower.possible_moves(white_player, c_cell, board)).to eql([])
        end
        it "dont have possible moves in the beggining(black)" do
            board = Board.new
            c_cell = [7,7]
            expect(tower.possible_moves(black_player, c_cell, board)).to eql([])
        end
        it "handles a board with pieces(white)" do
            board = Board.new
            board.board = [  [" "," "," "," "," "," "," "," "],
                            [" "," "," ","p"," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," ","T","K"," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [""," "," ","q"," "," "," "," "]]
            c_cell = [4,3]
            expect(tower.possible_moves(white_player, c_cell, board)).to eql([[4,2],[4,1],[4,0],[5,3],[6,3],[7,3],[3,3],[2,3],[1,3]])
        end
        it "handles a board with pieces(black)" do
            board = Board.new
            board.board = [  [" "," "," "," "," "," "," "," "],
                            [" "," "," ","p"," "," "," "," "],
                            [" ","p"," "," ","t"," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," ","","Q"," "," "," "],
                            [" "," "," "," ","B"," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [""," "," ","q"," "," "," "," "]]
            c_cell = [2,4]
            expect(tower.possible_moves(black_player, c_cell, board)).to eql([[2,5],[2,6],[2,7],[2,3],[2,2],[3,4],[4,4],[1,4],[0,4]])
        end
    end
end