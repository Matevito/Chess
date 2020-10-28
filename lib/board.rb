class Board
    attr_reader :board
    def initialize
        @board = [  ["T","N","B","Q","K","B","N","T"],
                    ["P","P","P","P","P","P","P","P"],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    ["p","p","p","p","p","p","p","p"],
                    ["t","n","b","q","k","b","n","t"]]
    end
    def move_in_board?(position)
        return false if position[0] < 0 || position[1] < 0
        return false if position[0] > 7 || position[1] > 7
        return true
    end
end