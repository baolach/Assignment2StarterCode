class Level extends GameObject
{
    //levels
  color colour;
  PVector startPos;
  PVector endPos;

  Level(float x1, float y1, float x2, float y2){
    this.colour = color(255);
    this.startPos = new PVector(x1, y1);
    this.endPos = new PVector(x2, y2);
  }


  void display()
  {
    fill(colour);
    line(startPos.x, startPos.y, endPos.x, endPos.y);
  }
}
  
