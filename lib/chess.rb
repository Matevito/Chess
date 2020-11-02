require_relative "pieces/bishop"
require_relative "pieces/king"
require_relative "pieces/knight"
require_relative "pieces/pawn"
require_relative "pieces/queen"
require_relative "pieces/tower"

class ChessGame
    include GameMethods
    def checkmate?(player, board)
        king = King.new
        if king.check?(player,board)
            if self.stalemate?(player,board)
                return true
            end
        end
        return false
    end
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
        path = correct_path(path)
        path = search_checks(path, position, player, board)
        return path
    end
    def valid_move?(player, move, board)
        start = chess_to_num(move[1])
        destination = chess_to_num(move[2])
        color = player.color
        piece_path = self.piece_path(start, color, board)
        return true if piece_path.include?(destination)
        return false
    end
    def castle?(player, move, board, historial)
        return false unless move == "o-o" || move == "o-o-o"
        color = player.color
        king = King.new
        king.check?(player,board)
        if color == "white"
            king = [0,4]
            return false if piece_moved?(king, historial)
            if move == "o-o"
                tower = [0,7]
                return false if piece_moved?(tower, historial)
                return false unless clean_row?(king, tower, board)
                return false if castle_king_checks?(king, tower, player, board)
            elsif move == "o-o-o"
                tower = [0,0]
                return false if piece_moved?(tower, historial)
                return false unless clean_row?(king, tower, board)
                return false if castle_king_checks?(king, tower, player, board)
            end
        elsif color == "black"
            king = [7,4]
            return false if piece_moved?(king, historial)
            if move == "o-o"
                tower = [7,7]
                return false if piece_moved?(tower, historial)
                return false unless clean_row?(king, tower, board)
                return false if castle_king_checks?(king, tower, player, board)
            elsif move == "o-o-o"
                tower = [7,0]
                return false if piece_moved?(tower, historial)
                return false unless clean_row?(king, tower, board)
                return false if castle_king_checks?(king, tower, player, board)
            end
        end
        # castling does not produce a checK!
        test_board = Board.new
        board_copy = board.board.dup.map(&:dup)
        test_board.board = board_copy
        test_board.casstle(move, player)
        king = King.new

        return false if king.check?(player, test_board)

        return true
    end
    def en_passant?(player, move, board, historial)
        color = player.color
        start = chess_to_num(move[1])
        destination = chess_to_num(move[2])
        column = destination[1]
        last_move = historial.last
        current_board = board.board
        # color piece a pawn in the right spot
        # a pawn is not moved
        return false if move[0] != "p" && color == "black"
        return false if move[0] != "P" && color == "white"
        # the pawn is really in the board starting position!
        return false if current_board[start[0]][start[1]] != move[0]
        if color == "white"
            return false if start[0] != 4
        elsif color =="black"
            return false if start[0] != 3
        end
        
        # the enemy pawn jas just moved 2 squares in a valid spot
        if color = "white" && last_move[0] == "p"
            last_start = chess_to_num(last_move[1])
            last_destination = chess_to_num(last_move[2])
            if last_start[1] == column && last_destination[1] == column
                if last_start[0] - 2 == last_destination[0]
                    test_board = Board.new
                    board_copy = current_board.dup.map(&:dup)
                    test_board.board = board_copy
                    test_board.en_passant(move, player)
                    king = King.new
                    return true unless king.check?(player, test_board)
                end
            end
        elsif color = "black" && last_move[0] == "P"
            last_start = chess_to_num(last_move[1])
            last_destination = chess_to_num(last_move[2])
            if last_start[1] == column && last_destination[1] == column
                if last_start[0] + 2 == last_destination[0]
                    test_board = Board.new
                    board_copy = current_board.dup.map(&:dup)
                    test_board.board = board_copy
                    test_board.en_passant(move, player)
                    king = King.new
                    return true unless king.check?(player, test_board)
                end
            end
        end
        return false
    end
    def castle_king_checks?(king_position, tower_position, player, board)
        king = King.new
        color = player.color
        row = king_position[0]
        if tower_position[1] == 0
            path = [1,2,3]
        else
            path = [5,6]
        end
        path.each do |column|
            test_board = Board.new
            board_copy = board.board.dup.map(&:dup)
            test_board.board = board_copy
            board_copy = test_board.board
            board_copy[row][column] = board_copy[row][king_position[1]]
            board_copy[row][king_position[1]] = " "
            return true if king.check?(player, test_board)
        end

        return false
    end
end
chess = ChessGame.new
player = Player.new("1", "white")
move = "o-o"
board = Board.new
historial = [["K", "e4", "e5"],["K", "e5", "e4"]]
p "1st tests"
board.board = [["T"," "," "," ","K"," "," ","T"],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                ["t"," "," "," ","k"," "," ","t"]]
p chess.castle?(player, move, board, historial)
board.casstle(move, player)
board.print_board