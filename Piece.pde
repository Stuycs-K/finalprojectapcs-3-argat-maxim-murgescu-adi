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
    for(int y = 0; y < 4; y++)
    {
      shape[y] = original.shape[y].clone();
    }
  }
}
