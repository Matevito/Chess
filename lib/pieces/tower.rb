Class Tower
    def possible_moves(player, position, board)
        # the player and board arguments are objects
        color =  player.color
        possible_moves = []
        current_board = board.board
        # north column
        current_position = position
        until current_position[1] > 7
            current_position[1] += 1
            break unless move_in_board?(current_position)
            row = current_position[0]; column = current_position[1]
            if current_board[row][column] == " "
                possible_moves << current_position
            else
                board_cell = current_board[row][column]
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


    end
end