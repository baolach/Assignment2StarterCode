/* 
Inheritance refers to using the structure and behavior of a superclass in a subclass. Polymorphism refers to changing the behavior of a superclass in the subclass.
Ladder extends GameObject so inherits any variables that may be in this calss.
Polymorphism occurs here as the functions behave different within this class than in gameObject even tho it may have similar variables
*/

class Ladder extends GameObject
{
  
  PVector startPos;

  Ladder(float x1, float y1) // constructor creating the ladder coordintates for each ladder object
  {
    this.startPos = new PVector(x1, y1);
  }
  
  void display()
  {
    image(ladder , startPos.x, startPos.y);
  }
  
}
