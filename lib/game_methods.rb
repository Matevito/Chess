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
end