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
  public int posx;
  public int posy;
  
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
        if(shape()[y][x] != 0){
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
          map[y + posy][x + posx] = shape[y][x];
        }
      }
    }
    
    checkLines();
  }
}

void makeShapes()
{
  pieces = new Piece[1];
  // j shape (blue)
  int[][] rot1 = {{1, 0, 0},{1, 1, 1},{0, 0, 0}};
  int[][] rot2 = {{0, 1, 1},{0, 1, 0},{0, 1, 0}};
  int[][] rot3 = {{0, 0, 0},{1, 1, 1},{0, 0, 1}};
  int[][] rot4 = {{0, 1, 0},{0, 1, 0},{1, 1, 0}};
    
  pieces[0] = new Piece("J", new int[][][]{rot1, rot2, rot3, rot4});
}
