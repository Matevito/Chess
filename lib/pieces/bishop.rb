require_relative "../board"
require_relative "../player"
require_relative "../game_methods"
class Bishop < Board
    def possible_moves(player, position, board)
        color =  player.color
        possible_moves = []
        current_board = board.board
        current_position = position

        #diagonals from the right
        possible_moves.concat(self.get_diagonal([1,1], current_position, color, board))
        possible_moves.concat(self.get_diagonal([-1,1], current_position, color, board))
        #diagonals from the left
        possible_moves.concat(self.get_diagonal([-1,-1], current_position, color, board))
        possible_moves.concat(self.get_diagonal([1,-1], current_position, color, board))

        return correct_path(possible_moves)
    end
    def get_diagonal(direction, position, color, board_object)
        # direction is an array in the for of [x,y]; x row, y column
        possible_moves = []
        current_position = position.dup.map(&:dup)
        board = board_object.board
        until current_position[1] > 7 || current_position[1] < 0 || current_position[0] > 7 || current_position[0] < 0
            current_position[0] += direction[0]
            current_position[1] += direction[1]
            break unless move_in_board?(current_position)
            row = current_position[0]
            column = current_position[1]
            if board[row][column] == " "
                possible_moves.concat(current_position)
            else
                board_cell = board[row][column]
                if color == "white"
                    if board_cell == board_cell.downcase
                        possible_moves.concat(current_position)
                    end
                elsif color == "black"
                    if board_cell == board_cell.upcase
                        possible_moves.concat(current_position)
                    end
                end
                return possible_moves
            end
        end
        return possible_moves
    end
end