require_relative "player"
require_relative "chess"

class Game
    def play_game
        white_player = get_name("white")
        black_player = get_name("black")
        
    end
    def get_name(color)
        puts "\nput #{color} player name: "
        name = gets.chomp
        player = Player.new(name, color)
        return player
    end
end

chess = Game.new
chess.play_game