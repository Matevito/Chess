require_relative "pieces/bishop"
require_relative "pieces/king"
require_relative "pieces/knight"
require_relative "pieces/pawn"
require_relative "pieces/queen"
require_relative "pieces/tower"
class Board
    attr_accessor :board
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
    def stalemate?(player)
        color = player.color
        possible_moves = []
        for y in (0..7) do
            for x in (0..7) do
                if color == "white"
                    possible_moves << piece_path = self.piece_path([y,x], "black")
                else 
                    possible_moves << piece_path = self.piece_path([y,x], "white")
                end
            end
        end
        p "possible_moves"
        if possible_moves == []
            return true
        else
            return false
        end
    end
    def search_checks(path, current_piece, player)
        valid_moves = []
        piece_row = current_piece[0]
        piece_column = current_piece[1]
        king = King.new
        path.each do |cell|
            row = cell[0]; column = cell[1]
            test_board = Board.new
            test_board.board = @board.dup.map(&:dup)
            board_copy = test_board.board
            board_copy[row][column] = board_copy[piece_row][piece_column]
            board_copy[piece_row][piece_column] = " "
            valid_moves << cell unless king.check?(player, test_board)
        end
        return valid_moves
    end
    def piece_path(position, color)
        current_board = board.board
        cell_content = current_board[position[0]][position[1]]
        
        if cell_content == cell_content.upcase && color == "black"
            return []
        end
        if cell_content == cell_content.downcase && color == "white"
            return []
        end

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

board = Board.new

p board.stalemate?