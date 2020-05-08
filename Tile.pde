class Tile
{
  float x, y, w, h, v;

  Tile(float tempX, float tempY, float tempW, float tempH, int mapValue)
  {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    v = mapValue;
  }

  void display()
  {
    noStroke();
    if(v == 0)
    {
      fill(100);
    }
    if(v == 1)
    {
      fill(50, 50, 55); 
    }
    rectMode(CORNER);
    rect(x, y, w, h); 
  }
}