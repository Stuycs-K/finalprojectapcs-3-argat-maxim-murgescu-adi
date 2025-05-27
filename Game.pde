public Piece[] pieces;

public Piece currentPiece;
public int[][] map = new int[20][10];

public int gravityTime = 30;
public int gravityCount = 0;

void setup()
{
  size(800, 850);
  pieces = new Piece[]{jpiece, lpiece, spiece, zpiece, tpiece, opiece, ipiece};
}

void draw()
{
  drawMap();
  drawUI();
  
  // do logic for key repeating here, later
  
  tick();
  
  drawPiece(currentPiece);
}

void keyPressed()
{
  if(key == ' ' & currentPiece == null)
  {
    currentPiece = new Piece(pieces[(int)(Math.random() * 7)]);
  }
  if(currentPiece == null)
  {
    return;
  }
  if (key == CODED) {
    if (keyCode == LEFT)
    {
      currentPiece.posx--;
    } 
    else if (keyCode == RIGHT)
    {
      currentPiece.posx++;
    }
  }
}

void tick()
{
  if(currentPiece == null)
    return;
    
  gravityCount++;
  if(gravityCount >= gravityTime)
  {
    gravityCount = 0;
    currentPiece.posy++;
    if(currentPiece.checkCollision())
    {
      // place piece
      currentPiece.posy--;
      applyPiece(currentPiece);
      currentPiece = null;
    }
  }
}

void applyPiece(Piece piece)
{
    for(int y = 0; y < piece.shape.length; y++)
    {
      for(int x = 0; x < piece.shape[y].length; x++)
      {
        if(piece.shape[y][x] != 0)
        {
          map[y + piece.posy][x + piece.posx] = piece.shape[y][x];
        }
      }
    }
  }
