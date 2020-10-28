require_relative "./board"
Class Tower < Board
    def possible_moves(player, position, board)
        # the player and board arguments are objects
        color =  player.color
        possible_moves = []
        current_board = board.board
        current_position = position
        # north column
        
    end
    def get_column(direction, position, color, board)
        # direction is an array in the for of [x,y]
        possible_moves = []
        current_position = position
        until current_position[1] > 7
            current_position[0] += direction[0]
            current_position[1] += direction[1]
            break unless move_in_board?(current_position)
            row = current_position[0]; column = current_position[1]
            if board[row][column] == " "
                possible_moves << current_position
            else
                board_cell = board[row][column]
                if color == "white"
                    if board_cell == board_cell.downcase
                        possible_moves << current_position
                        break
                    end
                elsif color == "black"
                    if board_cell == board_cell.upcase
                        possible_moves << current_position
                        break
                    end
                end
            end
        end
        return possible_moves
    end
end