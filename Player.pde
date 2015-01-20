

class Player extends GameObject
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;
  


    
  Player()
  {
    pos = new PVector(width / 3, height / 3);
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
        
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
    if (checkKey(up))
    {
      pos.y -= 1;
    }
    if (checkKey(down))
    {
      pos.y += 1;
    }
    if (checkKey(left))
    {
      pos.x -= 1;
    }    
    if (checkKey(right))
    {
      pos.x += 1;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }    
  }
  
  void display()
  {    
    if( checkKey(right))
    {
      currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
      int offset = 0;
    
      for (int x = -100; x < width; x += images[0].width) 
      { 
        image(images[(currentFrame+offset) % numFrames], pos.x, pos.y);
        
      }
    }
    
     if(checkKey(left))
    {
      currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
      int offset = 0;
    
      for (int x = -100; x < width; x += images_images[0].width) 
      { 
        image(images_images[(currentFrame+offset) % numFrames], pos.x, pos.y);   
      }
    }
    
    if( (checkKey(left) == false) && (checkKey(right) == false) )
    {
      for (int x = -100; x < width; x += images_images[0].width) 
      { 
        image(cassie, pos.x,pos.y);
      }
    }

    



  }  
}
