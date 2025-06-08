color[] colors = new color[]{color(50, 50, 50), color(20, 20, 225), color(244, 140, 6), color(157, 78, 221), color(255, 221, 0), color(69, 221, 240), color(171, 225, 79), color(239, 35, 60)};

boolean doDebug = false;
boolean showNext = true;
void drawMap()
{
  noStroke();
  for(int y = 0; y < 20; y++)
  {
    for(int x = 0; x < 10; x++)
    {
      fill(25);
      rect(30 + x * 40 + xoffset, 25 + y * 40 + yoffset, 40, 40);
      fill(colors[map[y][x]]);
      rect(31 + x * 40 + xoffset, 26 + y * 40 + yoffset, 39, 39);
    }
  }
}

int xoffset = 0;
int yoffset = 0;
int yoff_vel = 0;
int xoff_vel = 0;

void drawUI()
{
  fill(0);
  // add text with updated score on top every frame
  rect(460 + xoffset, 25 + yoffset, 310, 100);
  rect(460 + xoffset, 150 + yoffset, 310, 300);
  
  fill(255);
  textSize(28);
  text("HOLD:", 525 + xoffset, 75 + yoffset);
  text("Score: " + score, 500 + xoffset, 200 + yoffset);
  text("Level: " + getLevel(), 500 + xoffset, 240 + yoffset);
  if(holdPiece != null)
  {
    int[][] shape = holdPiece.shape();  
  
    drawPieceSmall(shape,650, 50);
  }
  if(doDebug)
  {
  fill(200, 200, 20);
  text("Grace Period: " + gracePeriod, 500 + xoffset, 280 + yoffset);
  }
  
  if(showNext)
  {
    fill(255);
    textSize(28);
    text("NEXT:", 525 + xoffset, 375 + yoffset);
    drawPieceSmall(peekPiece().shape(), 650, 350);
  }
}
void drawPieceSmall(int[][] shape, int xpos, int ypos)
{
  for(int y = 0; y < shape.length; y++)
    {
      for(int x = 0; x < shape[y].length; x++)
      {
        if(shape[y][x] == 0)
          continue;
        fill(200);
        rect(xpos + (x) * 20 + xoffset, ypos + (y) * 20 + yoffset, 20, 20);
        fill(colors[shape[y][x]]);
        rect(xpos + 1 + (x) * 20 + xoffset, ypos + 1 + (y) * 20 + yoffset, 19, 19);
      }
    }
}


void drawPiece(Piece piece)
{
  if(piece == null)
    return;
    
  int[][] shape = piece.shape();  
  
  
  
  for(int y = 0; y < shape.length; y++)
  {
    for(int x = 0; x < shape[y].length; x++)
    {
      if(shape[y][x] == 0 | y + piece.posy < 0)
        continue;
      fill(200);
      rect(30 + (x + piece.posx) * 40 + xoffset, 25 + (y + piece.posy) * 40 + yoffset, 40, 40);
      fill(colors[shape[y][x]]);
      rect(31 + (x + piece.posx) * 40 + xoffset, 26 + (y + piece.posy) * 40 + yoffset, 39, 39);
    }
  }
}

void displayTick()
{
  yoffset += yoff_vel;
  if(yoffset > 0)
  {
    yoff_vel-= 2;
    if(yoffset + yoff_vel <= 0)
    {
      yoff_vel = 0;
      yoffset = 0;
    }
  }
  xoffset += xoff_vel;
  if(xoffset > 0)
  {
    xoff_vel-= 2;
    if(xoffset + xoff_vel <= 0)
    {
      xoff_vel = 0;
      xoffset = 0;
    }
  }
  else if(xoffset < 0)
  {
    xoff_vel += 2;
    if(xoffset + xoff_vel >= 0)
    {
      xoff_vel = 0;
      xoffset = 0;
    }
  }
}
