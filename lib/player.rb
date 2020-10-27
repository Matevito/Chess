class Player
    attr_reader :color, :name
    def initialize(name, color)
        @name = name
        @color = color
    end
    def make_move()
        # takes a move and returns it corresponding it's color value
        puts"\n#{@name}, insert a move:"
        current_move = gets.chomp
        move = current_move.split("-")
        #move format [current_piece, where_to_move]
        # todo: color format of move[0]
        return move
    end
end