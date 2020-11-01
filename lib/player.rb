class Player
    attr_reader :color, :name
    def initialize(name, color)
        @name = name
        @color = color
    end
    def get_input
        puts "\n#{name}, this are the game options:
    *Make a move in the game format (ex.e2-e3).
    *['save']: save the current game.
    *['quit']: this needs explication?"
        input = gets.chomp
        if input == "save" || input == "quit"
            return input
        else
            return make_move(input)
        end
    end
    def make_move(current_move)
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
                move_format << move[0][1,2]
            else
                move_format << move[0][0].upcase
                move_format << move[0][1,2] 
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