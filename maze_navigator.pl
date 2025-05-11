% Read cell content
get_cell(Maze, Row, Col, Cell) :-
    nth0(Row, Maze, MazeRow),
    nth0(Col, MazeRow, Cell).

% Count start cells
% Count total s cells in 2D maze
count_start([], 0).
count_start([Row | Rest], Count) :-
    count_row_start(Row, RowCount),
    count_start(Rest, RestCount),
    Count is RowCount + RestCount.

% Count number of starts in a single row
count_row_start([], 0).
count_row_start([s | T], Count) :-
    count_row_start(T, Rest), 
    Count is Rest + 1.
count_row_start([_ | T], Count) :-
    count_row_start(T, Count).

% Find coordinates of start cell
find_start(Maze, Row, Col) :-
    nth0(Row, Maze, MazeRow),
    nth0(Col, MazeRow, s), !.  % Cut prevents backtracking once found

% Define Movement Rules
move((Row, Col), up, (NewRow, Col)) :-
    NewRow is Row - 1.
move((Row, Col), down, (NewRow, Col)) :-
    NewRow is Row + 1.
move((Row, Col), left, (Row, NewCol)) :-
    NewCol is Col - 1.
move((Row, Col), right, (Row, NewCol)) :-
    NewCol is Col + 1.

% Valid Move Check 
valid_move(Maze, (Row, Col)) :-
    Row >= 0, Col >= 0,
    length(Maze, MazeRows), Row < MazeRows,
    nth0(Row, Maze, MazeRow),
    length(MazeRow, MazeCols), Col < MazeCols,
    get_cell(Maze, Row, Col, Cell),
    Cell \= w.

% Follow Action List 
% Base case: no more actions, check if current cell is exit
follow_actions(_, (Row, Col), [], Maze, _) :-
    get_cell(Maze, Row, Col, e).

% Recursive case: take one action, validate, then continue 
follow_actions(Maze, (Row, Col), [Action | Rest], FinalMaze, Visited) :-
    move((Row, Col), Action, (NewRow, NewCol)),
    valid_move(Maze, (NewRow, NewCol)),
    \+ member((NewRow, NewCol), Visited),  % Ensure no revisiting to avoid infinite recursion
    follow_actions(Maze, (NewRow, NewCol), Rest, FinalMaze, [(NewRow, NewCol) | Visited]).

% Main Predicate 
% Verify there is a path from start cell to exit cell
find_exit(Maze, Actions) :-
    count_start(Maze, 1),  % Ensure exactly one start point
    find_start(Maze, StartRow, StartCol),
    follow_actions(Maze, (StartRow, StartCol), Actions, Maze, [(StartRow, StartCol)]).
