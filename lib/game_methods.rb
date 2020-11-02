require 'yaml'
module GameMethods
    def chess_to_num(cell)
        # cell number format [row, column]
        cell = cell.downcase
        row = cell[1].to_i
        column = cell[0]
        case column
        when "a"
            column = 0
        when "b"
            column = 1
        when "c"
            column = 2
        when "d"
            column = 3
        when "e"
            column = 4
        when "f"
            column = 5
        when "g"
            column = 6
        when "h"
            column = 7
        end
        return [row-1, column]
    end
    def correct_path(path)
        new_path = []
        path = path.flatten
        (path.size/2).times do
            new_path << [path[0], path[1]]
            path.shift(2)
        end
        return new_path
    end
    def piece_moved?(piece_position, historial)
        historial.each do |position|
            next if position == "o-o"
            next if position == "o-o-o"
            start = chess_to_num(position[1])
            destination = chess_to_num(position[2])
            return true if start == piece_position
            return true if destination == piece_position
        end
        return false
    end
    def clean_row?(start, ending, board)
        current_board = board.board
        row = start[0]
        tower = ending[1]
        if ending[1] == 0
            path = [1,2,3]
            path.each{|column| return false unless current_board[row][column] == " "}
        elsif ending[1] == 7
            path = [5,6]
            path.each{|column| return false unless current_board[row][column] == " "}
        end
        return true
    end
    def load_game()
        files = Dir.entries("save_files/")
        files.delete(".")
        files.delete("..")
        puts "\nsave files:"
        files.each_with_index{|file, index| puts "#{index+1}: #{file}"}
        puts "\nchoose a save file (ex.3,4,etc.)"
        save_name = gets.chomp.to_i
        save_name = files[save_name-1]
        game_file = File.new("save_files/#{save_name}", 'r')
        saved_file = game_file.read
        YAML::load(saved_file)
    end
    def save_game(object)
        save_file = YAML.dump(object)
        save_name = "#{object.white_player.name}_vs_#{object.black_player.name}"
        game_file = File.new("save_files/#{save_name}.yaml", 'w')
        game_file.write(save_file)
    end
end