
void fall()
{

  for( int i = 0; i < num; i++) 
    {
      if( lives == 0)
       {
         Yfall[i] = 100;
       }
      
      image(bone, Xfall[i], Yfall[i]); // bones falling
 
    }
    
     for( int i = 0; i< num; i++) // makes boxes move and reposition at the top at a cert
     {
        Yfall[i] = Yfall[i] + (int) speed;
        if (Yfall[i] > height)
        {
          Yfall[i] = (int)random(-100);
          Xfall[i] = (int)random( width -50);
        }
     }
}



/*
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
    rect(Xgreen[i],greenPos.y); // shows Green bone and then it moves down the screen
    
  }
  
}

*/



     

