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
    end
end