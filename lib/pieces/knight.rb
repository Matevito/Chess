require_relative "../board"
require_relative "../player"
class Knight
    include GameMethods
    def possible_moves(player, position, board)
        color =  player.color
        possible_moves = []
        current_board = board.board
        current_position = position.dup.map(&:dup)

        possible_moves.concat([current_position[0]-2, current_position[1]+1])
        possible_moves.concat([current_position[0]-1, current_position[1]+2])
        possible_moves.concat([current_position[0]+1, current_position[1]+2])
        possible_moves.concat([current_position[0]+2, current_position[1]+1])
        possible_moves.concat([current_position[0]+2, current_position[1]-1])
        possible_moves.concat([current_position[0]+1, current_position[1]-2])
        possible_moves.concat([current_position[0]-1, current_position[1]-2])
        possible_moves.concat([current_position[0]-2, current_position[1]-1])
        
        knight_valid_moves = []
        possible_moves.each do |cell|
            if move_in_board?(cell)
                row = cell[0]
                column = cell[1]
                board_cell = current_board[row][column]
                if board_cell == " "
                    knight_valid_moves.concat(cell)
                elsif color == "white"
                    knight_valid_moves.concat(cell) if board_cell == board_cell.downcase
                elsif color == "black"
                    knight_valid_moves.concat(cell) if board_cell == board_cell.upcase
                end
            end
        end

        return knight_valid_moves
    end

end