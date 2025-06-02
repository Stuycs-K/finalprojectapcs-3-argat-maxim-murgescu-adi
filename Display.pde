color[] colors = new color[]{color(50, 50, 50), color(20, 20, 225), color(244, 140, 6), color(157, 78, 221), color(255, 221, 0), color(69, 221, 240), color(171, 225, 79), color(239, 35, 60)};


void drawMap()
{
  for(int y = 0; y < 20; y++)
  {
    for(int x = 0; x < 10; x++)
    {
      fill(25);
      rect(30 + x * 40, 25 + y * 40, 40, 40);
      fill(colors[map[y][x]]);
      rect(31 + x * 40, 26 + y * 40, 39, 39);
    }
  }
}

void drawUI()
{
  fill(0);
  // add text with updated score on top every frame
  rect(460, 25, 310, 100);
  rect(460, 150, 310, 300);
  
  fill(255);
  textSize(28);
  text("HOLD:", 525, 75);
  
  if(holdPiece != null)
  {
    int[][] shape = holdPiece.shape();  
  
    for(int y = 0; y < shape.length; y++)
    {
      for(int x = 0; x < shape[y].length; x++)
      {
        if(shape[y][x] == 0)
          continue;
        fill(200);
        rect(650 + (x) * 20, 50 + (y) * 20, 20, 20);
        fill(colors[shape[y][x]]);
        rect(651 + (x) * 20, 51 + (y) * 20, 19, 19);
      }
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
      if(shape[y][x] == 0)
        continue;
      fill(200);
      rect(30 + (x + piece.posx) * 40, 25 + (y + piece.posy) * 40, 40, 40);
      fill(colors[shape[y][x]]);
      rect(31 + (x + piece.posx) * 40, 26 + (y + piece.posy) * 40, 39, 39);
    }
  }
}
