/*
In this class the blue levels are drawn using PVectors for their positions
Also the time and lives are displayed on the level at the top for the player to see

When the object is created, Java calls the constructor first. Any code you have in your constructor will then get executed. 
You don't need to make any special calls to a constructor method - they happen automatically when you create a new object. 
Constructor methods take the same name as the class.
*/

class Level extends GameObject
{
   //levels
  color colour = #1203FF; // blue
  PVector startPos;
  PVector endPos;



  Level(float x1, float y1, float x2, float y2) // constructor creating the co ordinates for each floor
  {
    this.colour = colour;
    this.startPos = new PVector(x1, y1);
    this.endPos = new PVector(x2, y2);
  }


  void display()
  {
    
    strokeWeight(25);
    stroke(dblue);
    line(startPos.x,startPos.y, endPos.x, endPos.y);
    image(ball, 600, 115);
    ball.resize(35,35); // makes the image smaller than its orinigal dimensions


  }
  
  void update()
  {
   if( lives != 0 || lives <0)
   {
     textSize(35);
     fill(rblue);
     text("Lives:" +lives, 10, 45);
     
     time= frameCount;
   
     textSize(35);
     fill(rblue);
     text("Time:" +time, 150, 45);
     
   }
  
  }
  

 
}

  
