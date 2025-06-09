# Description

Maxim Argat and Adi Murgescu, Period 3
Group Name:
Project Description: This project will be a version of Tetris. It will feature all of the pieces and it will try to include as much of the original game's behavior as possible. This includes how it deals out pieces, how rotations are handled, the size of the game area, and also the ability to hold one piece to save it for later. If time permits, we also want to add things like effects when the player clears a line, and features to make the game more convinent to play. This could be little particles falling and fading away when lines are cleared, that are the colors of the tiles that are removed.
Critical (MVP) Features: The minimum playable state for this project would be the ability to move and rotate pieces on the game area, to place them down, and for the game to then check if it should clear a line. If it needs to, it shifts everything above it down, and adds some amount of score. It would then deal out the next piece, endlessly. If you stack pieces up to the top, the game ends.
Nice To Haves: The ability to press down / press space to make the piece drop faster / instantly, official recognition of how the pieces need to rotate, particles when you clear a line. The game would also speed up as you gain score for added challenge.

# UML Diagram

link to online UML: https://lucid.app/lucidchart/c4417686-7792-40be-879b-64b6f793d10a/edit?viewport_loc=314%2C598%2C1364%2C607%2C0_0&invitationId=inv_c8fefc8b-837a-4318-bd8a-1366da6c893e
![Alt text](Diagram1.jpg?raw=true "Diagram of UML" ) 

# Development Phases

Phase 1:
- ~~Create game area (20 x 10), make it display the different pieces and their colors~~
- ~~After you press space, it deals out a piece~~
- ~~That piece can be moved sideways, drops due to gravity~~
- ~~The piece stops after it hits the ground and cannot go off the edges of the area~~

Phase 2:
- ~~Piece rotations (probably by changing the array that defines the shape of the piece inside of the Piece instance)~~
- The piece 'kicks back' if rotated into somewhere according to official Tetris rules
- The piece doesn't rotate if no kickback makes sense
- ~~Line clears, shifts whatever is above it down~~
- Ability to quickly drop the piece --> ~~Soft Drop~~, Hard Drop
- The game detects when you've stacked too high, does nothing yet

Phase 3:
- The game adds score as you go, after certain amounts of score it speeds up gravity
- Ability to hold one piece to save for later
- Grace period when dropping a piece where you can move it along the floor

Phase 4 (Extra):
- particles when you clear the line
- screen might shake slightly when you hard drop

# Technical Details:

The whole game runs in Processing, so every frame we redraw the board and update the logic.  
The board itself is just a 10 × 20 `int` array holding color codes for each block.  
Every tetromino lives inside a `Piece` object, and each piece keeps its four rotations in a little 3-D array.  
`keyPressed()` does all the input work—arrows move and rotate, `SPACE` hard-drops, and `SHIFT` swaps with the hold box.  
Gravity is nothing fancy: a frame counter that gets shorter whenever the score pushes us to the next level.  
When a piece locks, we loop through each row; if it’s full, we clear it and slide everything above it down.  
On a clear we also spawn a few `Particle` objects so you get a quick burst of color that fades out over time.
     
# Project Design

* **Game (main sketch)** – owns the board, score, level, and the main `draw()` loop.  
* **Piece** – keeps all rotations, position, collision checks, hard-drop / soft-drop, and the hold flag.  
* **Particle** – tiny circle with its own position, velocity, and size that shrinks away each frame.  
* **Display helpers** – a few functions that draw the board, the active piece, the hold box, and the next-piece preview.

Everything plugs into `Game`: it updates pieces, checks for line clears, and spawns particles when needed.  
See UML diagrams.
    
# Intended pacing:

- **May 19–22** — Kick-off prototype: set up the Processing window, create the 10 × 20 board array, and sketch the basic UML on paper.  
- **May 27** — Write the first README draft and rebuild the UML diagram in an online editor.  
- **May 29** — Code the full rotation system and verify that every tetromino behaves correctly.  
- **June 03–05** — Finish all gameplay extras: score-based levels with faster gravity, level-skip keys, hold box, and particle clear effects.  
- **June 06** — Final polish—tidy the HUD layout, update the README, and record the demo video.
