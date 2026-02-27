% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
% shows there shoud be numbers 1-4 in each row, column and number in them
row(1..4).
col(1..4).
num(1..4).
% makes sure a number is in each box
1 { sudoku(R, C, N) : num(N) } 1 :- row(R), col(C).
%makes sure numbers that are pre-filled don't add another number
sudoku(R, C, N) :- initial(R, C, N).
% same numbers can't be in same column
:- sudoku(R1, C, N), sudoku(R2, C, N), R1 != R2.
% same numbers can't be in same row
:- sudoku(R, C1, N), sudoku(R, C2, N), C1 != C2.

% n is replaced by 1 to show we're in grid 1 with columns 1-2 and rows 1-2.
subgrid(R, C, 1) :- row(R), col(C), R <= 2, C <=2.
% n is replaced by 2 to show we're in grid 2 with columns 3-4 and rows 1-2.
subgrid(R, C, 2) :-  row(R), col(C), R <= 2, C >= 3.
% n is replaced by 3 to show we're in grid 3 with columns 1-2 and rows 3-4
subgrid(R, C, 3) :- row(R), col(C),  R >= 3, C <= 2.
% n is replaced by 4 to show we're in grid 4 with columns 3-4 and rows 3-4.
subgrid(R, C, 4) :-  row(R), col(C), R >= 3, C >= 3.

#show sudoku/3.
#show subgrid/3.