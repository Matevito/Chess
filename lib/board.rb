require "colorize"
class Board
    attr_accessor :board
    def initialize
        @board = [  ["T","N","B","Q","K","B","N","T"],
                    ["P","P","P","P","P","P","P","P"],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    ["p","p","p","p","p","p","p","p"],
                    ["t","n","b","q","k","b","n","t"]]
    end
    def move_in_board?(position)
        return false if position[0] < 0 || position[1] < 0
        return false if position[0] > 7 || position[1] > 7
        return true
    end
    def put_unicode(c_board)
        uni_board = []
        c_board.each do |cells|
            row = []
            cells.each do |c_cell|
                case c_cell
                when " "
                    new_content = "   "
                when "t"
                    new_content = " \u2656 "
                when "T"
                    new_content = " \u265C "
                when "n"
                    new_content = " \u2658 "
                when "N"
                    new_content = " \u265E "
                when "b"
                    new_content = " \u2657 "
                when "B"
                    new_content = " \u265D "
                when "q"
                    new_content = " \u2655 "
                when "Q"
                    new_content = " \u265B "
                when "k"
                    new_content = " \u2654 "
                when "K"
                    new_content = " \u265A "
                when "p"
                    new_content = " \u2659 "
                when "P"
                    new_content = " \u265F "
                end
                row << new_content
            end
            uni_board << row
        end
        return uni_board
        end
    def print_board
        board_p = @board.dup.map(&:dup)
        board_p = put_unicode(board_p)
        board_p = colorize_board(board_p)
        for x in (0..7) do
            i = 7-x
            puts "#{i+1} #{board_p[i][0]}#{board_p[i][1]}#{board_p[i][2]}#{board_p[i][3]}#{board_p[i][4]}#{board_p[i][5]}#{board_p[i][6]}#{board_p[i][7]}"
        end
        puts "   a  b  c  d  e  f  g  h"
    end
    def colorize_board(board)
        colorized_board = []
        for i in (0..7) do
            row = []
            if i % 2 == 0
                for x in (0..7)do
                    cell_content = board[i][x]
                    if x % 2 == 0
                        cell_content = board[i][x]
                        row << cell_content.colorize(:background => :light_black)
                    else
                        cell_content = board[i][x]
                        row << cell_content.colorize(:background => :light_blue)
                    end
                end
            else
                for x in (0..7)do
                    cell_content = board[i][x]
                    if x % 2 == 0
                        row << cell_content.colorize(:background => :light_blue)
                    else
                        row << cell_content.colorize(:background => :light_black)
                    end
                end
            end
            colorized_board << row
        end
        return colorized_board
    end
end
board = Board.new
board.print_board