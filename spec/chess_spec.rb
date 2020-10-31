require "./lib/chess"

describe ChessGame do
    describe "#stalemate?" do
        board = Board.new
        chess = ChessGame.new
        white_player = Player.new("1","white")
        black_player = Player.new("2", "black")
        it "bishop can't move protecting the king" do
            board.board = [ [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," ","T"," "," "," "],
                            [" "," "," "," "," "," ","Q"," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," ","k","b","Q"]]
            expect(chess.stalemate?(black_player, board)).to eql(true)
        end
        it "king can't move" do
            board.board = [ [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" ","k"," "," "," "," "," "," "],
                            [" ","q"," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            ["K"," "," "," "," "," "," "," "]]
            expect(chess.stalemate?(white_player, board)).to eql(true)
        end
        it "knight can move/ king not" do
            board.board = [ [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," ","T"," "," "," "],
                            [" "," "," "," "," "," ","Q"," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," ","k"," ","n"]]
            expect(chess.stalemate?(black_player, board)).to eql(false)                
        end
        it "there's no stalemate in beggining position" do
            board = Board.new
            expect(chess.stalemate?(white_player, board)).to eql(false)                
        end
    end
end