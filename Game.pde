// this file handles gameplay and input processing, main game loop

public Piece[] pieces;
public Piece currentPiece;

public int gravityTime = 15;
public int gravityCount = 0;

void setup()
{
  colorMode(RGB, 255, 255, 255);
  size(800, 850);
  makeShapes();
  //pieces = new Piece[]{jpiece, lpiece, spiece, zpiece, tpiece, opiece, ipiece};
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
    currentPiece = new Piece(dealPiece());
    return;
  }
  if(currentPiece == null)
  {
    return;
  }
  if (key == CODED) {
    if (keyCode == LEFT)
    {
      currentPiece.posx--;
      if(currentPiece.checkCollision())
        currentPiece.posx++;
    } 
    else if (keyCode == RIGHT)
    {
      currentPiece.posx++;
      if(currentPiece.checkCollision())
        currentPiece.posx--;
    }
    
    else if (keyCode == UP)
    {
      currentPiece.tryRotate();
    }
    else if(keyCode == DOWN)
    {
      currentPiece.posy++;
      if(currentPiece.checkCollision())
      {
        currentPiece.posy--;
      }
      else
      {
        gravityCount = 0;
      }
    }
  }
  else
  {
    if(key == ' ')
    {
      currentPiece.hardDrop();
      currentPiece = null;
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
      currentPiece.applyPiece();
      currentPiece = null;
    }
  } 
}
