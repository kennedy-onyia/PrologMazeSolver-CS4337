# DevLog
## May 10, 2025 - 1:23 pm
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


## May 10, 2025 - 5:12pm
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

 
## May 10, 2025 - 6:00 pm 
### Reflection
1. I realized I had two functions with the same name (count_start), which was confusing. I renamed one of them to count_row_start and grouped similar code together to make things easier to follow. I ran into this when I was attempting to simulate looping attributes to check the cells of each row. Prolog unfortunately doesn't support looping, so I had to recursively work my way down the list of lists.

2. I kept getting a weird error about a syntax problem at the end of the file. After prolonged search, it turned out I forgot to put a period '.' after my last rule. Oh, how I absolutely enjoy debugging for hours :)

3.  On the issue of debugging, Prolog doesn't give enough information when highlighting an error. It made it quite challenging to get to the root of the issue.

4.  I ran into a stack overflow error, of course! When i tried testing with the bad maps that had no end, it threw a Stack Overflow exception. In an attempt to solve this problem, I decided to include a check for when I visit a cell so I don't visit cells infinitely. After a few minutes of research I found a solution, but I didn't implement it correctly, which led to another issue. The solution was to use a pre-defined predicate "member". However, I forgot to include the preceding "\+", which caused my code to only go to visited cells instead of preventing it from revisiting those cells. That simple error also caused all my test cases to return false, because it never visited any cells.

