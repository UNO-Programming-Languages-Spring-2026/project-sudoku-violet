% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
% shows there shoud be numbers 1-4 in each row, column and number in them
row(1..4).
col(1..4).
number(1..4).
% makes sure a number is in each box
1 { sudoku(X, Y, N) : number(N) } 1 :- row(X), col(Y).
%makes sure numbers that are pre-filled don't add another number
sudoku(X, Y, N) :- initial(X, Y, N).
% same numbers can't be in same column
:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2.
% same numbers can't be in same row
:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2.

% n is replaced by 1 to show we're in grid 1 with columns 1-2 and rows 1-2.
subgrid(X, Y, 1) :- row(X), col(Y), X <= 2, Y <=2.
% n is replaced by 2 to show we're in grid 2 with columns 3-4 and rows 1-2.
subgrid(X,Y, 2) :-  row(X), col(Y), X <= 2, Y >= 3.
% n is replaced by 3 to show we're in grid 3 with columns 1-2 and rows 3-4
subgrid(X, Y, 3) :- row(X), col(Y),  X >= 3, Y <= 2.
% n is replaced by 4 to show we're in grid 4 with columns 3-4 and rows 3-4.
subgrid(X, Y, 4) :-  row(X), col(Y), X >= 3, Y >= 3.

#show sudoku/3.
#show subgrid/3.