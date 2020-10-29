require "./lib/pieces/knight"
require "./lib/player"
require "./lib/board"

describe Knight do
    knight = Knight.new
    describe "#possible moves" do
        white_player = Player.new("1","white")
        black_player = Player.new("2", "black")
        it "returns all the valid moves in a clean board" do
            board = Board.new
            board.board = [  [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                ["N"," "," "," "," "," "," "," "]]
            c_cell = [7,0]
            expect(knight.possible_moves(white_player, c_cell, board)).to eql([[5,1], [6,2]])
        end
        it "returns all valid moves in the center of a clean board" do
            board = Board.new
            board.board = [     [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," ","k"," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "],
                                [" "," "," "," "," "," "," "," "]]
            c_cell = [3,3]
            expect(knight.possible_moves(black_player, c_cell, board)).to eql([[1,4],[2,5],[4,5],[5,4],
                [5,2],[4,1],[2,1],[1,2]])
            
        end
        it "returns the valid move in the beggining possition" do
            board = Board.new
            c_cell = [7,1]
            expect(knight.possible_moves(black_player, c_cell, board)).to eql([[5,2],[5,0]])
        end
        xit "handles boards with multiple pieces(white)" do
            board = Board.new
        end
        xit "handles boards with multiple pieces(black)" do
            board = Board.new    
        end
    end
end