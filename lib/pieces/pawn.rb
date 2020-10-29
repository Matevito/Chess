require_relative "../board"
require_relative "../player"
require_relative "../game_methods"

class Pawn < board
    include game_methods
    def possible_moves(player, position, board)
        color = player.color
        current_board = board.board
        possible_moves = []

        if color == "white"
            possible_moves.concat([position[0]-1, position[1]])
            if position[1] == 1
                possible_moves.concat([position[0]-2, position[1]])
            end
        elsif color == "black"
            possible_moves.concat([position[0]+1, position[1]])
            if position[1] == 6
                possible_moves.concat([position[0]+2, position[1]])
            end
        end

        valid_moves = []
        possible_moves.each do |cell|
            row = current_board[0]; column = current_board[1]
            board_cell = current_board[row][column]
            if board_cell == " "
                valid_moves.concat([cell])
            end
        end
        return valid_moves
    end
    def capture_range()

    end
    def en_passant()
    
    end
    def can_promote?(player, position)

    end
    def promote

    end