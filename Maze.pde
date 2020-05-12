//Modified from John Kuiphoff
Rat rat;
Tile[] tiles =  new Tile[0];
int goalx = 256;
int goaly = 256;
int complete;

boolean stage1 = false;
boolean stage2 = false;
boolean stage3 = false;
boolean stage4 = false;

// Build Map Array
// 0s are permissible tiles in the maze, 1s are walls
int[][] mymap = {

  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
  { 1, 0, 1, 0, 0, 0, 0, 1, 1, 1 },
  { 1, 1, 0, 1, 1, 1, 0, 0, 0, 1 },
  { 1, 0, 0, 1, 0, 1, 0, 1, 0, 1 },
  { 1, 0, 1, 1, 0, 1, 1, 1, 0, 1 },
  { 1, 0, 1, 0, 0, 0, 1, 0, 0, 1 },
  { 1, 0, 1, 0, 1, 0, 1, 0, 1, 1 },
  { 1, 0, 1, 1, 1, 0, 1, 0, 0, 1 },
  { 1, 0, 0, 0, 0, 0, 1, 1, 0, 1 },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }

};

// Tile size
int tileW = 32;
int tileH = 32;

void setup()
{
  size(320, 320);
  smooth();

  // Create grid
  for (int i = 0; i <= 9; i++)
  {
    for (int j = 0; j <= 9; j++)
    {
      Tile a = new Tile(j*tileW, i*tileH, tileW, tileH, mymap[i][j]);
      tiles = (Tile[]) append(tiles, a);
    } 
  }

  // Create  rat object
   rat = new Rat(32, 32, 32, 32, color(255, 255, 255), 32);
}

void draw()
{
  // Set background
  background(255);

  // Create grid
  for(int i = 0; i < tiles.length; i++)
  {
    tiles[i].display();
  }

  // Display  rat if it is not in the goal
   if (rat.in_box() == false)
   {
     complete = 0;
     actionSelect();
     rat.display(); 
     //println(rat.x,rat.y);
   } else if (rat.in_box() == true){
     complete = complete + 1;
     background(0,255,0);
     if (complete == 1)
     {
       println("YOU WIN!"); 
       println("Time To Completion:");
       print(millis());
     }
   }

}

void actionSelect(){
  for(int i = 0; i < tiles.length; i++)
  {
    
    if(( rat.x == tiles[i].x) && ( rat.y == tiles[i].y))
    {
      if(millis() <= 10000) //stage 1 (bottom right)
      {
        if(tiles[i+1].v == 0.0) //right
        {
          rat.move("right");
          tiles[i].v = 1;
          break;
        }
        if(tiles[i+10].v == 0.0) //down
        {
          rat.move("down");
          tiles[i].v = 1;
          break;
        }
        if(tiles[i-1].v == 0.0) //left
        {
          rat.move("left");
          tiles[i].v = 1;
          break;
        }
        if(tiles[i-10].v == 0.0) //up
        {
          rat.move("up");
          tiles[i].v = 1;
          break;
        }
        
      }
      
      else if(millis() <= 20000) //stage 2 (bottom left)
      {
        if(!stage1)
        {
          // Create grid
          for (int b = 0; i <= 9; i++)
          {
            for (int j = 0; j <= 9; j++)
            {
              Tile a = new Tile(j*tileW, b*tileH, tileW, tileH, mymap[b][j]);
              tiles = (Tile[]) append(tiles, a);
            } 
          }
          stage1 = true;
        }
        
        if(tiles[i-1].v == 0.0) //left
        {
          rat.move("left");
          tiles[i].v = 1;
          break;
        }
        if(tiles[i+10].v == 0.0) //down
        {
          rat.move("down");
          tiles[i].v = 1;
          break;
        }
        if(tiles[i+1].v == 0.0) //right
        {
          rat.move("right");
          tiles[i].v = 1;
          break;
        }
        if(tiles[i-10].v == 0.0) //up
        {
          rat.move("up");
          tiles[i].v = 1;
          break;
        }
      }
    }
    
    else if(millis() <= 30000) //stage 3 (top right)
      {
        if(!stage2)
        {
          // Create grid
          for (int b = 0; i <= 9; i++)
          {
            for (int j = 0; j <= 9; j++)
            {
              Tile a = new Tile(j*tileW, b*tileH, tileW, tileH, mymap[b][j]);
              tiles = (Tile[]) append(tiles, a);
            } 
          }
          stage2 = true;
        }
     
        if(tiles[i+1].v == 0.0) //right
        {
          rat.move("right");
          tiles[i].v = 1;
          break;
        }
        if(tiles[i-10].v == 0.0) //up
        {
          rat.move("up");
          tiles[i].v = 1;
          break;
        }
        if(tiles[i-1].v == 0.0) //left
        {
          rat.move("left");
          tiles[i].v = 1;
          break;
        }
        if(tiles[i+10].v == 0.0) //down
        {
          rat.move("down");
          tiles[i].v = 1;
          break;
        }
      }
    }
    
    { if(millis() <= 40000) //stage 4 RNG
      {
        if(!stage3)
        {
          // Create grid
          for (int b = 0; b <= 9; b++)
          {
            for (int j = 0; j <= 9; j++)
            {
              Tile a = new Tile(j*tileW, b*tileH, tileW, tileH, mymap[b][j]);
              tiles = (Tile[]) append(tiles, a);
            } 
          }
          stage3 = true;
        }
     
        int r = int(random(1,5));
        if (r == 1)
        {
          rat.move("up");
        }
        if (r == 2)
        {
          rat.move("down");
        }
        if (r == 3)
        {
          rat.move("left");
        }
        if (r == 4)
        {
          rat.move("right");
        }
    }
    }
}
