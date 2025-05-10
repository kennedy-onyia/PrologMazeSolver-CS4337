% Read cell content
get_cell(Maze, Row, Col, Cell) :-
    nth0(Row, Maze, MazeRow),
    nth0(Col, MazeRow, Cell).

% Count start cells
count_start([], 0).
count_start([Row | Rest], Count) :-
    count_row_start(Row, RowCount),
    count_start(Rest, RestCount),
    Count is RowCount + RestCount.

% Find start cell

$ Define Movement Rules



