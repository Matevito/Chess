require "./lib/game_methods"

describe GameMethods do
    describe "#chess_to_num" do
        include GameMethods
        let(:dummy_class) { Class.new { include GameMethods } }
        let(:dummy_class) { Class.new { extend GameMethods } }
        it "transforms a cell into number array" do
            cell = "a3"
            expect(dummy_class.chess_to_num(cell)).to eql([2,0])
        end
    end
end