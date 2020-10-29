require_relative "../board"
require_relative "../player"
require_relative "../game_methods"
require_relative "pawn"
require_relative "knight"
require_relative "bishop"
require_relative "queen"
require_relative "tower"

class King < Board
    include GameMethods
    def possible_moves(player, position, board)

    end
    def check?(color, position, board)

    end
end