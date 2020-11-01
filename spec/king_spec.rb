require "./lib/pieces/king"
require "./lib/player"
require "./lib/board"

describe King do
    king = King.new
    describe "#get_king" do
        board = Board.new
        it "get white king in starting position" do
            expect(king.get_king("white", board.board)).to eql([0,4])
        end
        it "get black king in starting position" do
            expect(king.get_king("black", board.board)).to eql([7,4])
        end
        it "get black king in the center of the board" do
            board.board = [[" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," ","K"," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "]]
            expect(king.get_king("white", board.board)).to eql([4,4])
        end
    end
    describe "#check_path" do
        board = Board.new
        it "gets no path from a blank cell" do
            expect(king.check_path([4,0], board, "white")).to eql([])
        end
        it "get path of white knight" do
            expect(king.check_path([7,1], board, "black")).to eql([[5,2],[5,0]])
        end
        it "get path of black Tower" do
            board.board = [  [" "," "," "," "," "," "," "," "],
                            [" "," "," ","p"," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," ","T","K"," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [""," "," ","q"," "," "," "," "]]
            c_cell = [4,3]
            expect(king.check_path(c_cell, board, "white")).to eql([[4,2],[4,1],[4,0],[5,3],[6,3],[7,3],[3,3],[2,3],[1,3]])
        end
        it "get path of white queen" do
            board.board = [  [" "," "," "," "," "," "," "," "],
                            [" "," "," ","p"," "," "," "," "],
                            [" ","q"," "," "," "," "," "," "],
                            [" "," "," "," ","K"," "," "," "],
                            ["t"," "," ","Q"," "," ","T"," "],
                            [" "," "," "," "," "," "," "," "],
                            [" ","p"," ","P"," "," "," "," "],
                            [""," "," "," "," "," "," "," "]]
            c_cell = [4,3]
            expect(king.check_path(c_cell, board, "white")).to eql([
                [3,3],[2,3],[1,3],[4,4],[4,5],[5,4],[6,5],[7,6],
                [5,3],[5,2],[6,1],[4,2],[4,1],[4,0],[3,2],[2,1]])
        end
        it "get path of white bishop" do
            board.board = [  [" "," "," "," "," "," "," "," "],
                            [" "," "," ","p"," "," "," "," "],
                            [" ","q"," "," "," "," "," "," "],
                            [" "," "," "," ","K"," "," "," "],
                            [" "," "," ","B",""," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" ","p"," "," "," "," "," "," "],
                            [""," "," "," "," "," "," "," "]]
            c_cell = [4,3]
            expect(king.check_path(c_cell, board, "white")).to eql([[5,4],[6,5],[7,6],[5,2],[6,1],[3,2],[2,1]])
        end
        it "get path of black pawn" do
            board.board = [ [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" ","K"," "," "," "," "," "," "],
                            [" ","p"," "," "," "," "," "," "],
                            ["Q"," ","P"," "," "," "," "," "],
                            [" ","p"," "," "," "," "," "," "],
                            [" "," "," "," "," ","k"," "," "]]
            c_cell = [6,1]
            expect(king.check_path(c_cell, board, "black")).to eql([[5,2],[5,0]])
        end
    end
    describe "#check?" do
        board = Board.new
        white_player = Player.new("1","white")
        black_player = Player.new("2", "black")
        it "no check in starting possition" do
            expect(king.check?(black_player,board)).to eql(false)
        end
        it "pawn protecting from a check" do
            board.board = [ [" "," "," ","K"," "," "," "," "],
                            [" "," ","P"," "," "," "," "," "],
                            [" ","b"," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," ","p"," "," "],
                            [" "," "," "," ","p"," "," "," "],
                            [" "," "," "," "," "," ","n"," "]]
            expect(king.check?(white_player, board)).to eql(false)
        end
        it "check(white king)"do
            board.board = [[" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," ","n"," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," ","K"," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "]]
            expect(king.check?(white_player, board)).to eql(true)
        end
        it "check(black king)"do
            board.board = [[" "," "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "],
                        [" "," ","Q"," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "],
                        [" "," ","k"," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "]]
            expect(king.check?(black_player, board)).to eql(true)
        end
    end
    describe "#possible_moves" do
        board = Board.new
        king = King.new
        white_player = Player.new("1","white")
        black_player = Player.new("2", "black")
        it "no moves in beggining position" do
            expect(king.possible_moves(white_player,[0,4], board)).to eql([])
        end
        it "moves in a clean board" do
            board.board =  [[" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," ","k"," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "]]
            c_cell = [5,2]
            expect(king.possible_moves(black_player, c_cell, board)).to eql([[4,2],[4,3],[5,3],
                                                    [6,3],[6,2],[6,1],[5,1],[4,1]])
        end
        it "moves with blocked path of allies and board" do
            board.board =  [[" "," "," "," "," "," ","Q"," "],
                            [" "," "," "," "," "," "," ","K"],
                            [" "," "," "," "," "," ","N"," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            ["b"," "," "," "," "," "," "," "],
                            ["t","k"," "," "," "," "," "," "]]
            c_cell = [1,7]
            expect(king.possible_moves(white_player, c_cell, board)).to eql([[0,7],[2,7],[1,6]])
        end
        it "moves with blocked path with allies and possible checks" do
            board.board =  [[" "," "," "," "," "," ","Q"," "],
                            [" "," "," "," "," "," "," ","K"],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            ["t"," "," "," "," "," "," "," "],
                            ["b","k"," "," "," "," "," "," "]]
            c_cell = [1,7]
            expect(king.possible_moves(white_player, c_cell, board)).to eql([[2,7],[2,6]])
        end
        it "blocked path in front of an enemy king" do
            board.board =  [["k"," ","K"," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "]]
            c_cell = [0,0]
            expect(king.possible_moves(black_player, c_cell, board)).to eql([[1,0]])
        end
    end
end