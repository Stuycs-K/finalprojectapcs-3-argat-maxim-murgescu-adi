public int[][] map = new int[20][10];

void checkLines() // starting from bottom, checks all lines to see if they are complete. If they are, shifts rest of the map down (new arr for top row)
{
  for(int row = 19; row >= 0; row--)
  {
    boolean empty = false;
    for(int x = 0; x < 10; x++)
    {
      if(map[row][x] == 0)
      {
        empty = true;
        break;
      }
    }
    
    if(!empty)
    {
      // shift all previous rows down (up in terms of index)
      
      for(int i = row; i > 0; i--)
      {
        map[i] = map[i-1];
      }
      map[0] = new int[10];
      row--;
    }
  }
}
