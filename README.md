[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/YxXKqIeT)
# Project Description

Our project is a working a version of Tetris. It features all of the tetromino pieces and includes as much of the original game's behavior as we could. The user can cycle through the pieces, rotate them, and aim to stop the board from filling to the top by completing full rows of blocks.

The MVP includes the ability to move pieces around the game area, rotate them, place them, and then have the game automatically check for and clear any full lines. When a line is filled, everything above it shifts down and the player earns points. A new piece is then dealt, and play continues endlessly. If pieces stack to the top of the board, the game ends.

Beyond the MVP we added:  

* The ability to increase the speed a piece falls (soft-drop and hard-drop).  
* Automatic speeding up as the score crosses level thresholds for added challenge.  
* Small, colored particle effects when the player clears a line.
* Shaking effect when piece hits an edge of the board.
* Shortcuts to quickly jump to higher levels.

---

# Intended usage:

How the project will be used (user interface):
Update this with specific keys used to:
Space bar to toggle first piece and start playing. Once a piece is already falling on the board, pressing space again sends the piece as far down as it can go immediately, in its current orientation.

Left/right arrows to move the piece left/right.

Up arrow to rotate the piece (cycle through to find your desired rotation).

Down arrow to move the piece downward faster than the gravity (this and using space to push the piece down will increase your score more than waiting for gravity).

 Shift to hold the current piece and toggle the next piece - can only do this once per turn.

 Use the numbered keys 2 through 5 to jump to those levels or use the '=' key to jump up one level.
  
