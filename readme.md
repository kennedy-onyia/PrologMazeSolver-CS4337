# Prolog Maze Solver - CS 4337

This Prolog project implements a maze-solving predicate, find_exit/2, which determines whether a given sequence of moves leads from a start point (s) to an exit point (e) within a maze.

## Files Overview

- maze_navigator.pl --> Contains the main logic for the maze solver, including:

  - find_exit/2: Verifies if a sequence of moves leads from s to e.
  - Helper predicates for movement, cell access, and validation.

- example.pl --> Provides sample mazes for testing:

  - simple_map/1, bad_map/1, etc., representing various maze scenarios.
  - display_map/1: Visualizes the maze in a readable format.

- test.pl --> Includes predicates to generate random mazes:

  - gen_map/4: Generates a maze with specified parameters.

- devlog.md --> A development log documenting challenges encountered and solutions implemented during the project as prescribed by professor.

## How To Run the Program

1. Install SWI-Prolog:  
   Ensure SWI-Prolog is installed on your system. You can download it from [SWI-Prolog's official website](www.swi-prolog.org).

2. Clone the Repository:  
   `git clone https://github.com/kennedy-onyia/PrologMazeSolver-CS4337.git`  
   `cd PrologMazeSolver-CS4337`

3. Load the Prolog Files  
   In the SWI-Prolog terminal:  
   `?- [maze_navigator], [example], [test].`

4. Run Test Cases  
   Example:  
   `?- simple_map(M), display_map(M), find_exit(M, Actions).`  
   This will display the maze and determine if a valid path exists.<br>  
   To generate and test a random maze:  
   `?- gen_map(4, 6, 6, Maze), display_map(Maze), find_exit(Maze, Actions).`
