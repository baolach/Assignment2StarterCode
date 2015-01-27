/*void endscreen()
{
 
   
 
   lives = 3; // resets
 
  
   float f = 650;
 
  
  int dblue = 100; // dark blue
  int rblue = 200; // royal blue
  int lblue = #A7CAFF; // light blue= 3;
 
  float textposX = (f/10)/6 ; 
  float textposY = f/8;
  float textposX2 =(f/10)/6;
  float textposY2 = f/5;
  
  // positions of boxes for start and end screen
  float boxgap = f/16;
  float topX1 = f/4 ;
  float topY1 = f/3 ;
  float boxWidth = f/1.9 ;
  float boxHeight = f/6 ;
  float midX1 = f/4 ;
  float midY1 = f/2 ;
  float botX = f/4 ;
  float botY = (f/4)*3.2;
  
  if(lives == 0)
    {
      image(sleep, 100,100);
    }
  
  

    start.resize( width, height);
    image(start, 0, 0);

    
    // top box
    stroke(0,0, dblue); 
    strokeWeight( 5);
    fill( 0,0,rblue); // light blue
    rect( topX1, topY1, boxWidth, boxHeight);
    fill(225);
    textSize(f/15);
    text( "ENDSCREEN", topX1+textposX , topY1+ textposY);
    
    //middle box
    stroke(0,0, dblue);
    strokeWeight( 5);
    fill( 0,0,rblue); // light blue
    rect( midX1, midY1+boxgap, boxWidth, boxHeight);
    fill(225);
    textSize(f/22);
    text( "ENDSCREEN", midX1+textposX2, midY1+ textposY2);
  
    /*
    if((STARTSCREEN == true) && mouseX > topX1 && mouseX<topX1 +boxWidth && mouseY>topY1 && mouseY<topY1+boxHeight) // top box
    {
      fill(lblue); 
      rect( topX1, topY1, boxWidth, boxHeight);
      fill(100);
      textSize(f/15);
      text( "Press Q to Start", topX1+textposX , topY1+ textposY);
    }
  
    if((STARTSCREEN == true) && mouseX > midX1 && mouseX<midX1+boxWidth && mouseY>midY1+boxgap && mouseY<midY1+boxHeight+boxgap)
    {
      fill(lblue); 
      rect( midX1, midY1+boxgap, boxWidth, boxHeight);
      fill(100);
      textSize(f/22);
      text( "Press E for Instructions", midX1+textposX2, midY1+ textposY2);
    }
  
}  

 

*/
