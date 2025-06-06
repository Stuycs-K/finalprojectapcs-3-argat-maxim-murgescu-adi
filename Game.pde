// this file handles gameplay and input processing, main game loop

public Piece[] pieces;
public Piece currentPiece;
public Piece holdPiece;

public int gravityTime = 30;
public int gravityCount = 0;

// MAKE SURE TO ADD: keystrokes to jump levels
public int score = 0;
public int[] levels = {2500, 6000, 11000, 19000, 28000, 40000, 55000, 72000, 91000, 113000, 137000, 165000, 200000, 250000, 325000, 450000, 550000, 800000};

public int[] gravities = {40, 35, 31, 28, 24, 21, 19, 17, 15, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4};
boolean canHold = true;

public int gameStatus = 0; // 0 - before first piece, 1 - normal, 2 - after losing

void setup()
{
  colorMode(RGB, 255, 255, 255);
  size(800, 850);
  makeShapes();
  makeOffsets();
  //pieces = new Piece[]{jpiece, lpiece, spiece, zpiece, tpiece, opiece, ipiece};
  currBag = newBag(); // avoids index errors
}

void draw()
{
  background(170);
  displayTick();
  drawMap();
  drawUI();
  
  // do logic for key repeating here, later
  
  if(gameStatus == 1)
    tick();
  else if(gameStatus == 2)
  {
    textSize(64);
    fill(235, 20, 20);
    text("You Lost!", 490, 600);
  }
  
  drawPiece(currentPiece);
}

void keyPressed()
{
  if(key == ' ' & gameStatus == 0)
  {
    currentPiece = new Piece(dealPiece());
    gameStatus = 1;
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
      if(gracePeriod != 0)
        gracePeriod = 30;
    } 
    else if (keyCode == RIGHT)
    {
      currentPiece.posx++;
      if(currentPiece.checkCollision())
        currentPiece.posx--;
      if(gracePeriod != 0)
        gracePeriod = 30;
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
        score++;
      }
    }
    else if(keyCode == SHIFT)
    {
      if(canHold) // if allowed to do this
      {
        canHold = false;
        Piece temp = currentPiece;
        currentPiece = holdPiece;
        holdPiece = temp;
        
        holdPiece.posx = 3;
        holdPiece.posy = -1;
        holdPiece.whichrot = 0;
        
        if(currentPiece == null)
        {
          currentPiece = new Piece(dealPiece());
        }
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

int pieceDealWait;
int gracePeriod;

void tick()
{
  
  if(currentPiece == null)
  {
    if(pieceDealWait <= 0)
      currentPiece = new Piece(dealPiece());
    else
    {
      pieceDealWait--;
      return;
    }
  }
  
  if(gracePeriod > 0)
  {
    // grace period behavior
    gracePeriod--;
    if(gracePeriod == 0)
    {
      currentPiece.applyPiece();
    }
    else if(!currentPiece.graceCheck())
    {
      gracePeriod = 0;
      gravityCount = 0;
    }
  }
  else
  {
  gravityCount++;
  if(gravityCount >= gravities[getLevel()-1])
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
    else if(currentPiece.graceCheck())
    {
      gracePeriod = 30;
    }
  } 
  }
}

int getLevel()
{
  int l = 1;
  for(int i = 0; i < levels.length; i++)
  {
    if(score > levels[i])
      l++;
    else
      return l;
  }
  return l;
}
