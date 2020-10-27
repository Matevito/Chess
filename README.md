# Chess game using ruby!


Notation format
----
The notation format that this program uses is bases on algebraic notation. Each move consist of two parts: 1) the first points to the current piece that the current player wants to move. Each of the pieces of the game mantain the letters used in algebraic notation(king:K, knight:N, bishop:B, etc.) and then is represented in minor case the cell the piece is currently placed(e4, a1, h8, etc.). The pawns just require the current cell they are placed. 2) the second part represents the cell where the piece is going to be moved (h7, b3, I think you kinda get the idea.). 

As a summary, the format can be resumed in the following way: "[current_cell][-][cell_to_move]". THe only exception about this notation is in castle that uses the normal algebraic notation: "o-o" (castle in king side) and "o-o-o" (castle in queen side). Also, is not necessary to put explicitly that the move performed is taking a rival piece.
Examples: 

Ka1-a2 (King from a1 to a2).
b3-b4 (pawn b3 to b4).
o-o-o (queen side castle).

Game features
----
1. Performs a game of chess in the terminal with two human player (localy).
2. Save and load games that have been played in the program(does not read games in algebraic notation).
3. Prevents players from making illegal moves.
4. Declares check and checkmate.
5. The board printed in the terminal uses the uni-code chess symbols.
