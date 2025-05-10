# DevLog
## May 10, 2025 1:23 pm
### Project Overview
The goal of this project is to implement a maze-solving program in Prolog using a predicate called find_exit/2. The predicate takes a maze and either verifies if a given list of actions successfully leads from a start (s) to an exit (e), or finds a valid path if the list is unbound.

### Maze Features
Represented as a 2D list of rows, each containing cells of the following types:
* f: floor (open path)
* w: wall (blocked)
* s: start (exactly one per maze)
* e: exit (one or more allowed)

### Predicate Requirements
* Accept a maze and a list of actions ([left, right, up, down])
* Succeed only if the actions lead from s to any e without walking off the map or into walls
* Work even when the action list is an unbound variable
* Fail on invalid mazes (e.g., multiple start cells or none at all)

## May 10, 2025 5:12pm
### Approach
* Write helper predicates to:
  * Get cell values/content (i.e. f, w, s, or e)
  * Count start cells for validation
  * Find the start cell 
  * Apply movement actions
  * Check move validity
 
* Validation Logic:
  * Early fail if there is not exactly one start point
  * Fail if any action leads out of bounds or into a wall
  * Only succeed if the path ends on an exit cell
 
* Test Plan:
  * Use example.pl and test.pl to verify program is working as expected   
