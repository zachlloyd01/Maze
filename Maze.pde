//Modified from John Kuiphoff
Rat rat;
Tile[] tiles =  new Tile[0];
int goalx = 96;//goal's x value
int goaly = 192;//goal's y value
int complete;


// Build Map Array
// 0s are permissible tiles in the maze, 1s are walls
int[][] mymap = {

  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
  { 1, 0, 1, 0, 0, 0, 0, 0, 0, 1 },
  { 1, 0, 0, 1, 0, 1, 0, 1, 0, 1 },
  { 1, 1, 0, 1, 0, 1, 0, 1, 0, 1 },
  { 1, 0, 0, 1, 0, 1, 1, 1, 0, 1 },
  { 1, 0, 1, 0, 0, 1, 1, 0, 0, 1 },
  { 1, 0, 1, 0, 1, 0, 0, 0, 1, 1 },
  { 1, 0, 1, 1, 1, 0, 1, 0, 0, 1 },
  { 1, 0, 0, 0, 0, 0, 1, 1, 0, 1 },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }



};

// Tile size
int tileW = 32;//width of the tile
int tileH = 32;//height of the tile

void setup()//setup function
{
  size(320, 320);//size of the screen
  smooth();//Draws smooth edges (anti-aliased)

  // Create grid
  for (int i = 0; i <= 9; i++)//setting up the rows
  {
    for (int j = 0; j <= 9; j++)//setting up the columns 
    {
      Tile a = new Tile(j*tileW, i*tileH, tileW, tileH, mymap[i][j]);//creating new tiles
      tiles = (Tile[]) append(tiles, a);//adds a new tile to the new position
    } 
  }

  // Create  rat object
   rat = new Rat(32, 32, 32, 32, color(255, 255, 255), 32);//setting up the xy coordinates, width, heaight, color and speed of the rat character
}

void draw()//draw function
{
  // Set background
  background(255);//background is white

  // Create grid
  for(int i = 0; i < tiles.length; i++)//rat is in a permissible space 
  {
    tiles[i].display();
  }

  // Display  rat if it is not in the goal
   if (rat.in_box() == false)//rat has not reached the goal
   {
     complete = 0;//not completed the maze as rat is not in the goal
     actionSelect();//actions that the rat follows to get to the goal
     rat.display();//display rat function 
     //println(rat.x,rat.y);
   } else if (rat.in_box() == true){//rat has reached the goal
     complete = complete + 1;//move forward to complete the maze 
     background(0,255,0);//background should turn green when the goal is met 
     if (complete == 1)//completed the maze
     {
       println("YOU WIN!");//print you win in the console 
       println("Time To Completion:");//print time to completion in the console 
       print(millis());//record the time taken using the millis fucntion
     }
   }

}

void actionSelect(){//actions that the rat follows in order to reach the goal and complete the maze
  for(int i = 0; i < tiles.length; i++)//when rat is in permissible space 
  {
       int r = int(random(1,5));//rat moves randomly between the integers 1 and 5 
        if (r == 1){
          rat.move("up");//if the rat is at r=1 then it should move up following the action select instructions in class Rat
        }
        if (r == 2){
           rat.move("down");//if rat is at r=2 then it should move down following the action sleect instructions in class Rat
        }
        if (r == 3){
           rat.move("left");//if rat is at r=3 then it should move to the left following the action select instructions in class Rat
        }
        if (r == 4){
          rat.move("right");//if rat is at r=2 then it should move to the right following the action select instructions in class Rat
        }
    
    }
  }
