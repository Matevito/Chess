require_relative "../board"
require_relative "../player"
require_relative "../game_methods"

class Pawn < Board
    include GameMethods
    def possible_moves(player, position, board)
        color = player.color
        current_board = board.board
        possible_moves = []

        if color == "white"
            possible_moves.concat([position[0]+1, position[1]])
            if position[0] == 1
                possible_moves.concat([position[0]+2, position[1]])
            end
        elsif color == "black"
            possible_moves.concat([position[0]-1, position[1]])
            if position[0] == 6
                possible_moves.concat([position[0]-2, position[1]])
            end
        end
        possible_moves = correct_path(possible_moves)
        valid_moves = []
        possible_moves.each do |cell|
            next unless move_in_board?(cell)
            row = cell[0]; column = cell[1]
            board_cell = current_board[row][column]
            if board_cell == " "
                valid_moves.concat([cell])
            end
        end
        return valid_moves
    end
    def capture_range(player, position, board)
        color = player.color
        current_board = board.board
        possible_candidates = []

        if color == "white"
            possible_candidates << [position[0]+1, position[1]+1]
            possible_candidates << [position[0]+1, position[1]-1]
        else
            possible_candidates << [position[0]-1, position[1]+1]
            possible_candidates << [position[0]-1, position[1]-1]
        end

        possible_captures = []
        possible_candidates.each do |cell|
            next unless move_in_board?(cell)
            row = cell[0]; column = cell[1]
            board_cell = current_board[row][column]
            next if board_cell == " "
            if color = "white" && board_cell = board_cell.downcase
                possible_captures.concat([cell])
            elsif color = "black" && board_cell = board_cell.upcase
                possible_captures.concat([cell])
            end
        end
        return possible_captures
    end
    def en_passant()
    
    end
    def can_promote?(player, position)

    end
    def promote

    end
end