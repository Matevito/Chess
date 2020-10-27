class Player
    attr_reader :color, :name
    def initialize(name, color)
        @name = name
        @color = color
    end
    def make_move()
        puts"\n#{@name}, insert a move:"
        current_move = gets.chomp
        # castle exception
        if current_move == "o-o" || current_move == "o-o-o"
            return current_move
        elsif current_move == "O-O" || current_move == "O-O-O"
            return current_move
        end
        # move format [current_piece, where_to_move]
        move = current_move.split("-")
        # todo: color format of move[0]
        return move
    end
end