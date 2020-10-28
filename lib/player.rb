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
        # move format [current_piece, current_cell, where_to_move]
        move = current_move.split("-")
        # modifify the current cell and current piece format
        move_format = []
        if move[0].length == 3
            if self.color == "black"
                move_format << move[0][0].downcase
                move_format << move[0][0,2]
            else
                move_format << move[0][0].uppercase
                move_format << move[0][0,2] 
            end
        else
            if self.color == "black"
                move_format << "p"
                move_format << move[0][0,2]
            else
                move_format << "P"
                move_format << move[0][0,2]
            end 
        end
        return move_format << move[1]
    end
end