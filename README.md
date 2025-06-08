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

Controls to play the game.

| Key | Action |
|-----|--------|
| `SPACE` | Start the first piece. While a piece is already on the board (active), `SPACE` performs a **hard drop** that instantly locks it. |
| `← / →` | Move the piece left / right. |
| `↑` | Rotate the piece 90 degrees (cycles through orientations). |
| Hold `↓` | **Soft drop** – move the piece downward faster than gravity, but controlled. |
| `SHIFT` | Hold the current piece and swap it with the piece in the hold box (once per turn) which you can see as the 'next' piece. |
| `2`, `3`, `4`, `5` | Jump directly to Levels 2–5. |
| `=` | Increase the score up to the next threshold, advances one level. |

Tip: Soft drops and hard drops award additional points compared to letting gravity do the work.
  
