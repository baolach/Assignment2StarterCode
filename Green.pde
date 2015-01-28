/*
This function controls the cats that fall. A simple array list is used
Once the cats hit the bottom the respawn at a random X and Y position at the top and come down again
*/

void fall()
{

  for( int i = 0; i < num; i++) 
    {
      if( lives == 0)
       {
         Yfall[i] = 100;
       }
      
      image(cat, Xfall[i], Yfall[i]); // cats falling
 
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



     

