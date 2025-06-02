import java.util.*;

//Piece jpiece = new Piece("J", new int[][] {{0,0,1,0}, {0,0,1,0}, {0,1,1,0}, {0,0,0,0}});
//Piece lpiece = new Piece("L", new int[][] {{0,1,0,0}, {0,1,0,0}, {0,1,1,0}, {0,0,0,0}});
//Piece tpiece = new Piece("T", new int[][] {{0,0,0,0}, {0,0,1,0}, {0,1,1,1}, {0,0,0,0}});
//Piece opiece = new Piece("O", new int[][] {{0,0,0,0}, {0,1,1,0}, {0,1,1,0}, {0,0,0,0}});
//Piece ipiece = new Piece("I", new int[][] {{0,0,1,0}, {0,0,1,0}, {0,0,1,0}, {0,0,1,0}});
//Piece spiece = new Piece("S", new int[][] {{0,0,0,0}, {0,1,1,0}, {1,1,0,0}, {0,0,0,0}});
//Piece zpiece = new Piece("Z", new int[][] {{0,0,0,0}, {0,1,1,0}, {0,0,1,1}, {0,0,0,0}});

public class Piece
{
  public int col = 1; // 1 is o yellow
  public int[][][] shapes;
  public int whichrot = 0;
  public int posx = 3;
  public int posy = -1;
  
  public Piece(String name, int[][][] shapes)
  {
    this.shapes = shapes;
  }
  
  public Piece(Piece original) // creates a clone of the piece, this one is moved / manipulated
  {
    shapes = original.shapes;
  }
  
  
  public boolean checkCollision()
  {
    for(int y = 0; y < shape().length; y++)
    {
      for(int x = 0; x < shape()[y].length; x++)
      {
        if(shape()[y][x] != 0 & y + posy >= 0){
        if(y + posy >= 20 || (x + posx) < 0 || (x + posx) >= 10)
        {
          return true; // fell off bottom
        }
        if(map[y + posy][x + posx] != 0)
        {
          return true; // is inside another placed piece
        }}
      }
    }
    return false;
  }
  
  public int[][] shape()
  {
    whichrot = whichrot % 4;
    return shapes[whichrot];
  }
  
  public void tryRotate()
  {
    whichrot++;
    if(checkCollision())
      whichrot--;
  }
  
  public void applyPiece()
  {
    int[][] shape = shape();
    for(int y = 0; y < shape.length; y++)
    {
      for(int x = 0; x < shape[y].length; x++)
      {
        if(shape[y][x] != 0)
        {
          if(y + posy < 0)
          {
            gameStatus = 2;
            return;
          }
          map[y + posy][x + posx] = shape[y][x];
        }
      }
    }
    canHold = true;
    pieceDealWait = 30;
    checkLines();
  }
  
  public void hardDrop()
  {
    int origpos = posy;
    while(!checkCollision())
    {
      posy++;
    }
    posy--;
    
    score += 2 * (posy - origpos);
    applyPiece();
  }
}

void makeShapes()
{
  pieces = new Piece[7];
  // j shape (1:blue)
  int[][] rot1J = {{1, 0, 0},{1, 1, 1},{0, 0, 0}};
  int[][] rot2J = {{0, 1, 1},{0, 1, 0},{0, 1, 0}};
  int[][] rot3J = {{0, 0, 0},{1, 1, 1},{0, 0, 1}};
  int[][] rot4J = {{0, 1, 0},{0, 1, 0},{1, 1, 0}};
    
  pieces[0] = new Piece("J", new int[][][]{rot1J, rot2J, rot3J, rot4J});
  
   // L shape (2:orange)
  int[][] rot1L = {{0, 0, 2},{2, 2, 2},{0, 0, 0}};
  int[][] rot2L = {{0, 2, 0},{0, 2, 0},{0, 2, 2}};
  int[][] rot3L = {{0, 0, 0},{2, 2, 2},{2, 0, 0}};
  int[][] rot4L = {{2, 2, 0},{0, 2, 0},{0, 2, 0}};
  pieces[1] = new Piece("L", new int[][][]{rot1L, rot2L, rot3L, rot4L});
  
  // T shape (3:purple)
  int[][] rot1T = {{0, 3, 0},{3, 3, 3},{0, 0, 0}};
  int[][] rot2T = {{0, 3, 0},{0, 3, 3},{0, 3, 0}};
  int[][] rot3T = {{0, 0, 0},{3, 3, 3},{0, 3, 0}};
  int[][] rot4T = {{0, 3, 0},{3, 3, 0},{0, 3, 0}};
  pieces[2] = new Piece("T", new int[][][]{rot1T, rot2T, rot3T, rot4T});

  // O shape (4:yellow)
  int[][] rot1O = {{0, 0, 0},{0, 4, 4},{0, 4, 4}};
  pieces[3] = new Piece("O", new int[][][]{rot1O, rot1O, rot1O, rot1O});

  // I shape (5:cyan)
  int[][] rot1I = {{0, 0, 0, 0},{5, 5, 5, 5},{0, 0, 0, 0}};
  int[][] rot2I = {{0, 5, 0},{0, 5, 0},{0, 5, 0},{0, 5, 0}};
  pieces[4] = new Piece("I", new int[][][]{rot1I, rot2I, rot1I, rot2I});

  // S shape (6:green)
  int[][] rot1S = {{0, 6, 6},{6, 6, 0},{0, 0, 0}};
  int[][] rot2S = {{0, 6, 0},{0, 6, 6},{0, 0, 6}};
  int[][] rot3S = {{0, 0, 0},{0, 6, 6},{6, 6, 0}};
  int[][] rot4S = {{6, 0, 0},{6, 6, 0},{0, 6, 0}};
  pieces[5] = new Piece("S", new int[][][]{rot1S, rot2S, rot3S, rot4S});

  // Z shape (7:red)
  int[][] rot1Z = {{7, 7, 0},{0, 7, 7},{0, 0, 0}};
  int[][] rot2Z = {{0, 0, 7},{0, 7, 7},{0, 7, 0}};
  int[][] rot3Z = {{0, 0, 0},{7, 7, 0},{0, 7, 7}};
  int[][] rot4Z = {{0, 7, 0},{7, 7, 0},{7, 0, 0}};
  pieces[6] = new Piece("Z", new int[][][]{rot1Z, rot2Z, rot3Z, rot4Z}); 
}

Piece[] newBag()
{
  Piece[] bag = new Piece[7];
  for(int i = 0; i < 7; i++)
  {
    boolean placed = false;
    while(!placed)
    {
      int toindex = (int)(Math.random() * 7);
      if(bag[toindex] == null)
      {
        placed = true;
        bag[toindex] = pieces[i];
      }
    }
  }
  return bag;
}

Piece[] currBag;
int bagindex = 0;

Piece dealPiece() // returns the next piece, removes it out of the bag, makes a new bag if needed
{
  if(bagindex > 6 | currBag == null)
  {
    bagindex = 0;
    currBag = newBag();
  }
  
  Piece dealed = currBag[bagindex];
  bagindex++;
  return dealed;
}
