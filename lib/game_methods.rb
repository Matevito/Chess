require_relative "pieces/pawn"
require_relative "pieces/knight"
require_relative "pieces/bishop"
require_relative "pieces/queen"
require_relative "pieces/tower"
require_relative "pieces/king"
module GameMethods
    def chess_to_num(cell)
        # cell number format [row, column]
        cell = cell.downcase
        row = cell[1].to_i
        column = cell[0]
        case column
        when "a"
            column = 0
        when "b"
            column = 1
        when "c"
            column = 2
        when "d"
            column = 3
        when "e"
            column = 4
        when "f"
            column = 5
        when "g"
            column = 6
        when "h"
            column = 7
        end
        return [row-1, column]
    end
    def correct_path(path)
        new_path = []
        (path.size/2).times do
            new_path << [path[0], path[1]]
            path.shift(2)
        end
        return new_path
    end
    def check_path(position, board, color)
        cell_content  = board[position[0]][position[1]]
        # check if the current cell has a piece of the player color
        unless position == position.upcase && color == "white"
            return []
        end
        unless position == position.downcase && color == "black"
            return []
        end

        # check the path of the piece
        if color == "white"
            player = Player.new("0", "white")
        else
            player = Player.new("1", "black")
        end

        case cell_content
        when "T"||"t"
            piece = Tower.new
        when "N"||"n"
            piece = Knight.new
        when "B"||"b"
            piece = Bishop.new
        when "Q"||"q"
            piece = Queen.new
        when "K"||"k"
            piece = King.new
        when "P"||"p"
            piece = Pawn.new

        if cell_content == "P" || cell_content == "p"
            return piece.capture_range(player, position, board)
        else
            return piece.possible_moves(player, position, board)
        end

    end
end