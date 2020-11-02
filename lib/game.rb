require_relative "player"
require_relative "chess"
require_relative "game_methods"

class Game
    include GameMethods
    def user_interface
        puts "\n\u2654 CHESS \u265B"
        puts "\nLoad game[l] or New game[else..]"
        game_mode = gets.chomp
        current_game = if game_mode == "l"
                            load_game()
                        else
                            ChessGame.new
                        end
        current_game.play_game
        puts "\nThanks for playing!"
    end
end

chess = Game.new
chess.user_interface