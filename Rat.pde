class Rat
{
  float x, y, w, h;
  color c;
  float s;

  Rat(float tempX, float tempY, float tempW, float tempH, color tempColor, float tempSpeed)
  {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c = tempColor;
    s = tempSpeed;
  }
  boolean in_box()
  {
    if ((rat.x == goalx) && (rat.y == goaly)){
       background(0);
       return true;
    } else {
       return false; 
    }
  }

  void display()
  {
    fill(c);
    noStroke();
    ellipseMode(CORNER);
    ellipse(x, y, w, h); 
  }

  void move(String direction)
  {
      // Directions
      if(direction == "up")
      {
        for(int i = 0; i < tiles.length; i++)
        {
          if(( rat.x == tiles[i].x) && ( rat.y == tiles[i].y))
          {
            if(tiles[i-10].v == 0.0)
            {
               rat.y =  rat.y - s;
              break;
            }
          }
        }
      }
      if(direction == "down")
      {
        for(int i = 0; i < tiles.length; i++)
        {
          if(( rat.x == tiles[i].x) && ( rat.y == tiles[i].y))
          {
            if(tiles[i + 10].v == 0.0)
            {
               rat.y =  rat.y + s;
               break;
            }
          }
        }
      }
      if(direction == "left")
      {

        for(int i = 0; i < tiles.length; i++)
        {
          if(( rat.x == tiles[i].x) && ( rat.y == tiles[i].y))
          {
            if(tiles[i-1].v == 0.0)
            {
               rat.x =  rat.x - s;
              break;
            }
          }
        }
      }
      if(direction == "right")
      {
        for(int i = 0; i < tiles.length; i++)
        {
          if(( rat.x == tiles[i].x) && ( rat.y == tiles[i].y))
          {
            if(tiles[i+1].v == 0.0)
            {
               rat.x =  rat.x + s;
              break;
            }
          }
        }
      }
    }
}