
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
