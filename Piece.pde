import java.util.*;

Piece jpiece = new Piece("J", new int[][] {{0,0,1,0}, {0,0,1,0}, {0,1,1,0}, {0,0,0,0}});
Piece lpiece = new Piece("L", new int[][] {{0,1,0,0}, {0,1,0,0}, {0,1,1,0}, {0,0,0,0}});
Piece tpiece = new Piece("T", new int[][] {{0,0,0,0}, {0,0,1,0}, {0,1,1,1}, {0,0,0,0}});
Piece opiece = new Piece("O", new int[][] {{0,0,0,0}, {0,1,1,0}, {0,1,1,0}, {0,0,0,0}});
Piece ipiece = new Piece("I", new int[][] {{0,0,1,0}, {0,0,1,0}, {0,0,1,0}, {0,0,1,0}});
Piece spiece = new Piece("S", new int[][] {{0,0,0,0}, {0,1,1,0}, {1,1,0,0}, {0,0,0,0}});
Piece zpiece = new Piece("Z", new int[][] {{0,0,0,0}, {0,1,1,0}, {0,0,1,1}, {0,0,0,0}});

public class Piece
{
  public int col = 1;
  public int[][] shape;
  public int posx;
  public int posy;
  
  public Piece(String name, int[][] map)
  {
    shape = map;
  }
  
  public Piece(Piece original) // creates a clone of the piece, this one is moved / manipulated
  {
    shape = new int[4][];
    for(int y = 0; y < shape.length; y++)
    {
      shape[y] = original.shape[y].clone();
    }
  }
  
  
  public boolean checkCollision()
  {
    for(int y = 0; y < shape.length; y++)
    {
      for(int x = 0; x < shape[y].length; x++)
      {
        if(shape[y][x] != 0){
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
}
