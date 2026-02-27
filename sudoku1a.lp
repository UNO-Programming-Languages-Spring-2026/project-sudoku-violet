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
1 { sudoku(X, Y, N) : num(N) } 1 :- row(X), col(Y).
%makes sure numbers that are pre-filled don't add another number
sudoku(X, Y, N) :- initial(X, Y, N).
% same numbers can't be in same column
:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2.
% same numbers can't be in same row
:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2.

#show sudoku/3.
