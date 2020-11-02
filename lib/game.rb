require_relative "player"
require_relative "chess"

class Game
    def user_interface
        current_game = ChessGame.new
        current_game.play_game
    end
end

chess = Game.new
chess.user_interface