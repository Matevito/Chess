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
            player.stub(:gets).and_return("a3-a4\n")
            expect(player.make_move).to eql(["p","a3","a4"])
        end
        it "works with player being white" do
            white_player.stub(:gets).and_return("Ne6-d4\n")
            expect(white_player.make_move).to eql(["N","e6","d4"])
        end
        it "handles castle cases" do
            player.stub(:gets).and_return("o-o-o\n")
            expect(player.make_move).to eql("o-o-o")
        end
        it "handles castle cases in upcase" do
            white_player.stub(:gets).and_return("O-O\n")
            expect(white_player.make_move).to eql("O-O") 
        end
        it "white player moving pawn" do
            white_player.stub(:gets).and_return("e6-e7\n")
            expect(white_player.make_move).to eql(["P","e6","e7"])
        end
        it "black player moving a piece" do
            player.stub(:gets).and_return("Bd4-h8\n")
            expect(player.make_move).to eql(["b", "d4", "h8"])
        end
    end
end