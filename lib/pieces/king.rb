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
    def check?(player, board)
        color = player.color
        king_position = self.get_king(color, board.board)
        # if the path of an enemy piece has the current cell of the king, is a check
        if color == "white"
            for y in (0..7) do
                for x in (0..7)do
                    return true if self.check_path([y,x], board,"black").include?(king_position)
                end
            end
        elsif color == "black"
            for y in (0..7) do
                for x in (0..7)do
                    return true if self.check_path([y,x], board, "white").include?(king_position)
                end
            end
        end
        return false
    end
    def get_king(color, board)
        if color == "white"
            for y in (0..7) do
                for x in (0..7)do
                    c_cell = board[y][x]
                    return [y,x] if c_cell == "K"
                end
            end
        elsif color == "black"
            for y in (0..7) do
                for x in (0..7)do
                    c_cell = board[y][x]
                    return [y,x] if c_cell == "k"
                end
            end
        end
    end
    def check_path(position, board, color)
        current_board = board.board
        cell_content  = current_board[position[0]][position[1]]
        # check if the current cell has a piece of the player color
        if cell_content == cell_content.upcase && color == "black"
            return []
        end
        if cell_content == cell_content.downcase && color == "white"
            return []
        end

        # check the path of the piece
        if color == "white"
            player = Player.new("0", "white")
        else
            player = Player.new("1", "black")
        end
        case cell_content
        when "T"
            piece = Tower.new
        when "t"
            piece = Tower.new
        when "N"
            piece = Knight.new
        when "n"
            piece = Knight.new
        when "B"
            piece = Bishop.new
        when "b"
            piece = Bishop.new
        when "Q"
            piece = Queen.new
        when "q"
            piece = Queen.new
        when "K"
            piece = King.new
        when "k"
            piece = King.new
        when "P"
            piece = Pawn.new
        when "p"
            piece = Pawn.new
        end
        if cell_content == "P" || cell_content == "p"
            return piece.capture_range(player, position, board)
        else
            return piece.possible_moves(player, position, board)
        end

    end
end