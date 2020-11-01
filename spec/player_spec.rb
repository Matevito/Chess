require "./lib/player"

describe Player do
    player = Player.new("andres", "black")
    describe "readable initialize variables" do
        it "return the name of the player" do
            expect(player.name).to eql("andres")
        end
        it "return the color of pieces the player is using" do
            expect(player.color).to eql("black")
        end
    end
    describe "#make move_method" do
        white_player= Player.new("test", "white")
        it "return the move in the array format" do
            expect(player.make_move("a3-a4")).to eql(["p","a3","a4"])
        end
        it "works with player being white" do
            expect(white_player.make_move("Ne6-d4")).to eql(["N","e6","d4"])
        end
        it "handles castle cases" do
            expect(player.make_move("o-o-o")).to eql("o-o-o")
        end
        it "handles castle cases in upcase" do
            expect(white_player.make_move("O-O")).to eql("O-O") 
        end
        it "white player moving pawn" do
            expect(white_player.make_move("e6-e7")).to eql(["P","e6","e7"])
        end
        it "black player moving a piece" do
            expect(player.make_move("Bd4-h8")).to eql(["b", "d4", "h8"])
        end
    end
end