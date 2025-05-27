public Piece[] pieces;

public Piece currentPiece;

void setup()
{
  size(800, 850);
  pieces = new Piece[]{jpiece, lpiece, spiece, zpiece, tpiece, opiece, ipiece};
  currentPiece = new Piece(pieces[0]);
}

void draw()
{
  drawMap();
  drawUI();
  
  drawPiece(currentPiece);
}
