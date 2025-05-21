# Description

Maxim Argat and Adi Murgescu, Period 3
Group Name:
Project Description: This project will be a version of Tetris. It will feature all of the pieces and it will try to include as much of the original game's behavior as possible. This includes how it deals out pieces, how rotations are handled, the size of the game area, and also the ability to hold one piece to save it for later. If time permits, we also want to add things like effects when the player clears a line, and features to make the game more convinent to play. This could be little particles falling and fading away when lines are cleared, that are the colors of the tiles that are removed.
Critical (MVP) Features: The minimum playable state for this project would be the ability to move and rotate pieces on the game area, to place them down, and for the game to then check if it should clear a line. If it needs to, it shifts everything above it down, and adds some amount of score. It would then deal out the next piece, endlessly. If you stack pieces up to the top, the game ends.
Nice To Haves: The ability to press down / press space to make the piece drop faster / instantly, official recognition of how the pieces need to rotate, particles when you clear a line. The game would also speed up as you gain score for added challenge.

# UML Diagram

![Alt text](Diagram1.jpg?raw=true "Diagram of UML" ) 

# Development Phases

Phase 1:
- Create game area (20 x 10), make it display the different pieces and their colors
- After you press space, it deals out a piece
- That piece can be moved sideways, drops due to gravity
- The piece stops after it hits the ground and cannot go off the edges of the area

Phase 2:
- Piece rotations (probably by changing the array that defines the shape of the piece inside of the Piece instance)
- The piece 'kicks back' if rotated into somewhere according to official Tetris rules
- The piece doesn't rotate if no kickback makes sense
- Line clears, shifts whatever is above it down
- Ability to quickly drop the piece
- The game detects when you've stacked too high, does nothing yet

Phase 3:
- The game adds score as you go, after certain amounts of score it speeds up gravity
- Ability to hold one piece to save for later
- Grace period when dropping a piece where you can move it along the floor

Phase 4 (Extra):
- particles when you clear the line
- screen might shake slightly when you hard drop

# Technical Details:

(CHANGE THIS!!!!!)

A description of your technical design. This should include: 
   
How you will be using the topics covered in class in the project.
     
# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.
    
# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)
