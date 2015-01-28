/*
  The player is created and placed at the bottom left
  The movement of the player (Cassie) is updated here so that the player moves. It does this by simply checking if a button is being pressed or released
  The images are also shown here so when the right button is pressed, Cassie walks right etc. THis acceses the array or images and gives the effect of an animation
  The hit detection is shown here also which measures the distance between the player and the cat/ favourite toy and acts accordingly

*/

class Player extends GameObject // any variables in gameobject are global
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
    pos = new PVector(width / 15,  height - (height / 7)); // creates coordinates
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
     // checks buttons and adds/ subtratcs from player position
    if (checkKey(up))
    {
      if ( (pos.x >525 && pos.x < 555) && (pos.y> 440))  // if up is pressed at the ladder1
      {
        pos.y -= 5;
      }
      
      if ( (pos.x >75 && pos.x <115 ) && (pos.y> 315 && pos.y<520)) // if up is pressed at ladder 2
      {
         pos.y -= 5;
      }
      
      if ((pos.x >475 && pos.x <515 ) && (pos.y> 195 && pos.y<400) ) // if up is pressed at ladder 3
      {
         pos.y -= 5;
      }
      
     if((pos.x >105 && pos.x <145 ) && (pos.y> 75 && pos.y<280) ) // if up is pressed at level 4
     {
        pos.y -= 5;
     }

    } // end up
    
    
    if (checkKey(down))
    {
       if ( (pos.x >525 && pos.x < 555) && (pos.y> 430 && pos.y<560))  // if down is pressed at the ladder1
      {
        pos.y += 5;
      }
      
      if ( (pos.x >75 && pos.x <115 ) && (pos.y> 300 && pos.y<430)) // if down is pressed at ladder 2
      {
         pos.y += 5;
      }
      
      if ((pos.x >475 && pos.x <515 ) && (pos.y> 185 && pos.y<310) ) // if down is pressed at ladder 3
      {
         pos.y += 5;
      }
      
     if((pos.x >105 && pos.x <145 ) && (pos.y> 65 && pos.y<190) ) // if down is pressed at level 4
     {
        pos.y += 5;
     }
    } // End check(down) 
    
    
    
    
    if (checkKey(left))
    {
      if (pos.x<0)
      {
        pos.x = pos.x + (width/ 15); // if off to screen to the left it shifts it back
      }
      else if ((pos.x >525 && pos.x < 555) && (pos.y> 440 && pos.y<560)) // if on ladder1 , don't move (pos.x >525 && pos.x < 555) && (pos.y> 430 && pos.y<560)
      {
      }
      else if ((pos.x >75 && pos.x <115 ) && (pos.y> 320 && pos.y<430)) // if on ladder2 , don't move
      {
      }
      else if ((pos.x >475 && pos.x <515 ) && (pos.y> 195 && pos.y<310) ) // if on ladder3 , don't move
      {
      }
      else if ((pos.x >105 && pos.x <145 ) && (pos.y> 75 && pos.y<190) ) // if on ladder4 , don't move
      {
      }
      else
      {
        pos.x -= 5;
      }
    }
    
    if (checkKey(right) )
    {
      if ((pos.x>width -(width/15))) // if off to screen to the right it shifts it back
      {
        pos.x = pos.x - (width/ 15);
      }
      else if ((pos.x >525 && pos.x < 555) && (pos.y> 440 && pos.y<560)) // if on ladder1 , don't move
      {
      }
      else if ((pos.x >75 && pos.x <115 ) && (pos.y> 320 && pos.y<430)) // if on ladder2 , don't move
      {
      }
      else if ((pos.x >475 && pos.x <515 ) && (pos.y> 195 && pos.y<310) ) // if on ladder3 , don't move
      {
      }
      else if ((pos.x >105 && pos.x <145 ) && (pos.y> 75 && pos.y<190) ) // if on ladder4 , don't move
      {
      }
      else
      {
        pos.x += 5; // if off the ladder, you can move
      }
    }
   
   
   
    
  // hit detection   
  for( int i = 0; i < num; i++)
  {
    if( dist( pos.x + speed, pos.y, Xfall[i], Yfall[i]) <= 50)
    {
      Xfall[i] = (int)random(0, 550);
      Yfall[i] = 0;
      
      bark = minim.loadFile("dog_barking_10.mp3"); 
      bark.play();
      
      meow = minim.loadFile("cat_meow_human_voice_3.mp3"); 
      meow.play();
      
      lives = lives - 1;
      
      
     if( lives == 0) // goes to endscreen()
      {
        pos.x = width / 15;
        pos.y = height - (height / 7);
         
      }
      else if( lives < 0) // just to double check
      {
        pos.x = width / 15;
        pos.y = height - (height / 7) + 5;
      }
    } // end if
    
    if( dist( pos.x + speed, pos.y, 600, 115) <= 62) // her favourite toy
    {
      cheer = minim.loadFile("cheer.mp3"); 
      cheer.play();
      lives = 0;
      pos.x = width / 15; // position of cassie
      pos.y = (height - (height / 7)) +5;
    
    }

  } // end for hit detection
  
  
  
} // end update()
        



  // DISPLAY FUNCTION FOR THE PLAYER CLASS
  void display()
  {    
     if( (checkKey(left) == false) && (checkKey(right) == false) && (checkKey(up) == false) && (checkKey(down) == false) ) // this makes image disappear if any of the others are showing
    {
        
       image(cassie, pos.x, pos.y);
    }
    
    if( checkKey(right))
    {
      currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
      int offset = 0; // which frame
    
      for (int x = -100; x < width; x += images[0].width) 
      { 
        image(images[(currentFrame+offset) % numFrames], pos.x, pos.y);
        
      }
    }
    
     if(checkKey(left))
    {
      currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
      int offset = 0;
    
      for (int x = -100; x < width; x += images2[0].width) 
      { 
        image(images2[(currentFrame+offset) % numFrames], pos.x, pos.y);   
      }
    }
    
 
    if(checkKey(up) || checkKey(down) )
    {
      currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
      int offset = 0;
    
      for (int x = -100; x < width; x += climb[0].width) 
      { 
        image(climb[(currentFrame+offset) % numFrames], pos.x, pos.y);   
      }
    }

  } // end display()  

}


