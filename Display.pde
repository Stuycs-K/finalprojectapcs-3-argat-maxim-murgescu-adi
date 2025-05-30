color[] colors = new color[]{color(50, 50, 50), color(20, 20, 225)};


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
