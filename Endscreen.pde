/*
This function is called if lives = 0. The boxes are drawn and you can either return to the main menu or play again straight away
There is an animation of Cassie sleeping which I think is pretty cool. An array of images and a forloop is used to do this
Your time is also posted at the top
*/


void endscreen()
{
 
   // positions of boxes  and text
  float f = 650;
  float textposX = (f/10)/6 ; 
  float textposY = f/8;
  float textposX2 =(f/10)/6;
  float textposY2 = f/5;
  
  float boxgap = f/16;
  float topX1 = f/4 ;
  float topY1 = f/3 ;
  float boxWidth = f/1.9 ;
  float boxHeight = f/6 ;
  float midX1 = f/4 ;
  float midY1 = f/2 ;
  float botX = f/4 ;
  float botY = (f/4)*3.2;
  
   background(10);
   image(title, 50,100);

 
    fill(255,0,0); // red
    textSize(35);
    text( "Final Score: " +time, 210, 180);
 


    
    // top box
    stroke(dblue); 
    strokeWeight( 5);
    fill( rblue); // light blue
    rect( topX1, topY1, boxWidth, boxHeight);
    fill(dblue);
    textSize(f/15);
    text( "Press T to exit", topX1+textposX , topY1+ textposY);
    
    //middle box
    stroke(dblue);
    strokeWeight( 5);
    fill( rblue); // light blue
    rect( midX1, midY1+boxgap, boxWidth, boxHeight);
    fill(dblue);
    textSize(f/28);
    text( "Press R to return to Home\n Screen or Q to Play again", (midX1+textposX2)+15, (midY1+ textposY2)-50);
    

    // Animation of Cassie sleeping
     currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
     int offset = 0; // which frame
    
      for (int x = -100; x < width; x += images[0].width) 
      { 
        frameRate(1);
        sleeping[0].resize(200,150);
        sleeping[1].resize(200,150);
        image(sleeping[(currentFrame+offset) % numFrames], 235, 480);
        
      }
   
    if((lives  == 0) && mouseX > topX1 && mouseX<topX1 +boxWidth && mouseY>topY1 && mouseY<topY1+boxHeight) // top box
    {
      fill(dblue); 
      rect( topX1, topY1, boxWidth, boxHeight);
      fill(rblue);
      textSize(f/17);
      text( "Press T to exit", topX1+textposX+25, topY1+ textposY);
    }
  
   
    if((lives == 0) && mouseX > midX1 && mouseX<midX1+boxWidth && mouseY>midY1+boxgap && mouseY<midY1+boxHeight+boxgap)
    {
      fill(dblue); 
      rect( midX1, midY1+boxgap, boxWidth, boxHeight);
      fill(rblue);
      textSize(f/28);
      text( "Press R to return to Home\n Screen or Q to Play again", midX1+textposX2 + 15, midY1+ textposY2 - 50);
    }
    
 
}  
