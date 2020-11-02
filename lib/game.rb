require_relative "player"
require_relative "chess"

class Game
    attr_accessor :historial
    def initialize
        @historial = []
    end
    def play_game
        white_player = get_name("white")
        black_player = get_name("black")
        board = Board.new
        puts ""
        board.print_board
        chess = ChessGame.new
        move = white_player.get_input
        
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