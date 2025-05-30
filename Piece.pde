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
  int[][] rot1L = {
    {0, 0, 2},
    {2, 2, 2},
    {0, 0, 0}
  };
  int[][] rot2L = {
    {0, 2, 0},
    {0, 2, 0},
    {0, 2, 2}
  };
  int[][] rot3L = {
    {0, 0, 0},
    {2, 2, 2},
    {2, 0, 0}
  };
  int[][] rot4L = {
    {2, 2, 0},
    {0, 2, 0},
    {0, 2, 0}
  };
  pieces[1] = new Piece("L", new int[][][]{ rot1L, rot2L, rot3L, rot4L });
  
}
