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
                            [" "," "," ","T"," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "]]
            c_cell = [4,4]
            expect(tower.possible_moves(white_player, c_cell, board)).to eql([[4,5],[4,6],[4,7],[4,3],[4,2],[4,1],[4,0],[5,4],[6,4],[7,4],[3,4],[2,4],[1,4],[0,4]])
        end
        xit "dont have possible moves in the beggining(white)" do
            
        end
        xit "dont have possible moves in the beggining(black)" do
        end
        xit "handles a board with pieces(white)" do
            
        end
        xit "handles a board with pieces(black)" do
            
        end
    end
end