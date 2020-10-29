require_relative "../board"
require_relative "../player"
require_relative "../game_methods"
require_relative "pawn"
require_relative "knight"
require_relative "bishop"
require_relative "queen"
require_relative "tower"

class King < Board
    include GameMethods
    def possible_moves(player, position, board)

    end
    def check?(player, position, board)
        color = player.color
        current_board = board.board

        if color == "white"
            for y in range(0..7) do
                for x in range(0..7)do
                    c_cell = current_board[y][x]
                    return true if check_path(c_cell, current_board,"black").include?(position)
                end
            end
        elsif color == "black"
            for y in range(0..7) do
                for x in range(0..7)do
                    c_cell = current_board[y][x]
                    return true if check_path(c_cell, current_board, "white").include?(position)
                end
            end
        end
        return false
    end
end