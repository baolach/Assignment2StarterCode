/*
This function simply displays the startscreen which also shows the instructions

*/
 
 int dblue = color(9,3,225); // dark blue
 int rblue = color(0,215,255); // turquoise
  
void startscreen()
{

  float f = 650;
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
  
    background(10);
    
    image(title, 50,100);
    
    // top box
    stroke(dblue); 
    strokeWeight( 5);
    fill( rblue); // light blue
    rect( topX1, topY1, boxWidth, boxHeight);
    fill(dblue);
    textSize(f/17);
    text( "Press Q to Start", topX1+textposX+25, topY1+ textposY);
    
    if((startscreen == true) && mouseX > topX1 && mouseX<topX1 +boxWidth && mouseY>topY1 && mouseY<topY1+boxHeight) // top box
    {
      fill(dblue); 
      rect( topX1, topY1, boxWidth, boxHeight);
      fill(rblue);
      textSize(f/17);
      text( "Press Q to Start", topX1+textposX+25, topY1+ textposY);
    }
    
    
    image(instructs, 80 , 400); // shows the instructions

}


