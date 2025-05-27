void drawMap()
{
  for(int y = 0; y < 20; y++)
  {
    for(int x = 0; x < 10; x++)
    {
      fill(25);
      rect(30 + x * 40, 25 + y * 40, 40, 40);
      fill(50);
      rect(31 + x * 40, 26 + y * 40, 39, 39);
    }
  }
}

void drawUI()
{
  rect(460, 25, 310, 100);
  rect(460, 150, 310, 300);
}

void drawPiece(Piece piece)
{
  if(piece == null)
    return;
  for(int y = 0; y < 4; y++)
  {
    for(int x = 0; x < 4; x++)
    {
      if(piece.shape[y][x] == 0)
        continue; // random comment added so that the file is different when i commit
      fill(200);
      rect(30 + (x + piece.posx) * 40, 25 + (y + piece.posy) * 40, 40, 40);
      fill(250);
      rect(31 + (x + piece.posx) * 40, 26 + (y + piece.posy) * 40, 39, 39);
    }
  }
}
