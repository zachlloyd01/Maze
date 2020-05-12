//Modified from John Kuiphoff
Rat rat;
Tile[] tiles =  new Tile[0];
int goalx = 256;
int goaly = 256;
int complete;

// Build Map Array
// 0s are permissible tiles in the maze, 1s are walls
int[][] mymap = {

  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
  { 1, 0, 0, 0, 0, 0, 0, 1, 1, 1 },
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
      if(millis() <= 10000000)
      {
        if(tiles[i+1].v == 0.0)
        {
          rat.move("right");
          tiles[i].v = 1;
          break;
        }
        if(tiles[i+10].v == 0.0)
        {
          rat.move("down");
          tiles[i].v = 1;
          break;
        }
        if(tiles[i-1].v == 0.0)
        {
          rat.move("left");
          tiles[i].v = 1;
          break;
        }
        if(tiles[i-10].v == 0.0)
        {
          rat.move("up");
          tiles[i].v = 1;
          break;
        }
        
      }
      
      else if(millis() <= 20000)
      {
        
      }
    }  
  }
}  
