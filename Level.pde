/*
When the object is created, Java calls the constructor first. Any code you have in your constructor will then get executed. 
You don't need to make any special calls to a constructor method - they happen automatically when you create a new object. 
Constructor methods take the same name as the class.
*/

class Level extends GameObject
{
   //levels
  color colour = 0;
  PVector startPos;
  PVector endPos;


// dont know how it works coz its doing random shit

  Level(float x1, float y1, float x2, float y2) // constructor
  {
    this.colour = color(0);
    this.startPos = new PVector(x1, y1);
    this.endPos = new PVector(x2, y2);
  }
  
 


  void display()
  {
    strokeWeight(25);
    line( 0,160,650,160); // top floor
    line( 0,280,650,280); // third floor
    line( 0,400,650,400); // second floor
    line( 0,520,650,520); // first floor
    line( 0,650,650,650); // ground
    /*
   image(ladder, ladder1.x, ladder1.y);
   image(ladder, ladder2.x, ladder2.y);
   image(ladder, ladder3.x, ladder3.y);
   image(ladder, ladder4.x, ladder4.y);
   image(ladder, ladder5.x, ladder5.y);
   image(ladder, ladder6.x, ladder6.y);
*/



    

    //line(startPos.x, startPos.y, endPos.x, endPos.y);
  }
}
  
