require_relative "../board"
require_relative "../player"
require_relative "../game_methods"
class Tower < Board
    def possible_moves(player, position, board)
        # the player and board arguments are objects
        color =  player.color
        possible_moves = []
        current_board = board.board
        current_position = position

        # north, south, east and west columns
        possible_moves.concat(self.get_column([0,1], current_position, color, board))
        possible_moves.concat(self.get_column([0,-1], current_position, color, board))
        possible_moves.concat(self.get_column([1,0], current_position, color, board))
        possible_moves.concat(self.get_column([-1,0], current_position, color, board))
        return possible_moves
    end
    def get_column(direction, position, color, board_object)
        # direction is an array in the for of [x,y]
        possible_moves = []
        current_position = position.dup.map(&:dup)
        board = board_object.board
        until current_position[1] > 7 || current_position[1] < 0 || current_position[0] > 7 || current_position[0] < 0
            current_position[0] += direction[0]
            current_position[1] += direction[1]
            break unless move_in_board?(current_position)
            row = current_position[0]; column = current_position[1]
            if board[row][column] == " "
                possible_moves.concat(current_position)
            else
                board_cell = board[row][column]
                if color == "white"
                    if board_cell == board_cell.downcase
                        possible_moves.concat(current_position)
                        break
                    end
                elsif color == "black"
                    if board_cell == board_cell.upcase
                        possible_moves.concat(current_position)
                        break
                    end
                end
            end
        end
        p"possible moves for the moment #{possible_moves}"
        return possible_moves
    end
end
board = Board.new
white_player = Player.new("1","white")
board.board = [  [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," ","T"," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "]]
tower = Tower.new
p tower.possible_moves(white_player, [4,4], board)