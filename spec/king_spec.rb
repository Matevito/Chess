require "./lib/pieces/king"
require "./lib/player"
require "./lib/board"

describe King do
    describe "#get_king" do
        xit  "get white king in starting position" do

        end
        xit "get black king in starting position" do

        end

        xit "get black king in the center of the board" do

        end
    end
    describe "#check_path" do
        xit "get path of white knight" do

        end
        xit "get path of black Tower" do

        end
        xit "get path of white queen" do

        end
        xit "get path of black bishop" do

        end
        xit "get path of white pawn" do

        end
        xit "get path of black king" do

        end
    end
    describe "#check?" do
        xit "no check in starting possition" do

        end
        xit "pawn protecting from a check" do

        end
        xit "check(white king)"do
        
        end
        xit "check(black king)"do

        end
    end
    describe "#possible_moves" do
        xit "no moves in beggining position" do

        end
        xit "moves in a clean board" do

        end
        xit "moves with blocked path of allies and board" do

        end
        xit "moves with blocked path with allies and possible checks" do
            
        end
        xit "blocked path in front of an enemy king" do
            
        end
    end
end