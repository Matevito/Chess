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
        return [row, column]
    end
end