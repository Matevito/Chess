class Player
    attr_reader :color
    def initialize(name, color)
        @name = name
        @color = color
    end
    def make_move()
        #takes a move and returns it corresponding it's color value
        puts"\n#{@name}, insert a move:"
        current_move = gets.chomp
    end
end