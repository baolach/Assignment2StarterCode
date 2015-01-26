/*


int num = 2; // how many on the screen at once
int[] Xfall = new int[num]; // x position of things falling
int[] Yfall = new int[num]; // y position of things falling
int speed = 9;
int lives = 3;
int i;


PVector startPos;
PVector endPos;


cGreen extends GameObject
{
  
  
  Green(float x1, float y1) // constructor creating the co ordinates for x and y coordinates for each item
  {
    this.greenPos = new PVector(x1, y1);
  }
  




  void update()
  {
  }


  void display()
  {
    
    strokeWeight(25);
    stroke(255); // white
    rect(greenPos.x,greenPos.y); // shows Green bone and then it moves down the screen


  }
} // end Green class


/////////////////////////////////////////////////////////
class Green extends GameObject
{
  
  PVector greenPos;

  Green(float x1, float y1) // constructor creating the ladder coordintates for each ladder object
  {
    this.greenPos = new PVector(x1, y1);
  }
  
  void display()
  {
    strokeWeight(25);
    stroke(255); // white
    rect(greenPos.x,greenPos.y); // shows Green bone and then it moves down the screen
    
  }
  
}
 
 */  
