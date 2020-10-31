require_relative "pieces/bishop"
require_relative "pieces/king"
require_relative "pieces/knight"
require_relative "pieces/pawn"
require_relative "pieces/queen"
require_relative "pieces/tower"

class ChessGame
    include GameMethods
    def stalemate?(player,board)
        color = player.color
        possible_moves = []
        for y in (0..7) do
            for x in (0..7) do
                if color == "white"
                    possible_moves << piece_path = self.piece_path([y,x], "white", board)
                else 
                    possible_moves << piece_path = self.piece_path([y,x], "black" , board)
                end
            end
        end
        possible_moves = [possible_moves.flatten]
        p "possible_moves #{possible_moves}"
        if possible_moves == [[]]
            return true
        else
            return false
        end
    end
    def search_checks(path, current_piece, player, board)
        valid_moves = []
        piece_row = current_piece[0]
        piece_column = current_piece[1]
        king = King.new
        path = path.flatten
        path = correct_path(path)

        path.each do |cell|
            row = cell[0]; column = cell[1]
            test_board = Board.new
            test_board.board = board.board.dup.map(&:dup)
            board_copy = test_board.board
            board_copy[row][column] = board.board[piece_row][piece_column]
            board_copy[piece_row][piece_column] = " "
            valid_moves << cell unless king.check?(player, test_board)
        end
        return valid_moves
    end
    def piece_path(position, color, board)
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

        path = piece.possible_moves(player, position, board)
        p "#{path}"
        path = correct_path(path)
        path = search_checks(path, position, player, board)
        p "corrected-path #{path}"
        return path
        
    end
end
puts "\nTests 1."
board = Board.new
chess = ChessGame.new
white_player = Player.new("1", "white")
black_player = Player.new("0", "black")
board.board = [ [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," ","T"," "," "," "],
                [" "," "," "," "," "," ","Q"," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," ","k","b","Q"]]
p chess.stalemate?(black_player, board)

puts "\nTests 2."
board.board = [ [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," ","T"," "," "," "],
                [" "," "," "," "," ","q","Q"," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," ","k"," ","Q"]]
p chess.stalemate?(black_player, board)