void instructions()
{
  //sets all booleans 

  
 float var1= f/ 12;
 float rectX= f/10;
 float rectY = f/10;
 float textX = f/7;
 float textY = f/ 4;
 float gapY = f/16;
  
    instructions = loadImage("blur.jpg");
    instructions.resize(width, height);
    image(instructions, 0, 0);
    filter(BLUR,4);
    
    stroke(#120D5F);
    strokeWeight(5);
    fill(255,150); // fill(white, opacity)
    rect( rectX, rectY, f-(f/6), f-(f/4));
    
    
    // all text variables are dynamic so that they fit are versatile with any screen size
    fill(0);
    textSize(var1);
    text("Instructions", f/7, f/5);
    
    textSize(f/27);
    text("- Move with the left and right arrows", textX, textY + gapY);
    text("- Use the ladders on each level to reach \n   the dog's favourite toy\n", textX, textY + (2*gapY));
    text("- Avoid the other falling bones which are \n   being thrown by the evil cat \n", textX, textY + (4*gapY)  );
    text("- You have 3 lives", textX, textY + (6*gapY));
    text("- Reach the toy as quick as you can to get a \n   highscore\n", textX, textY + (7*gapY));


    textSize(f/41);
    text("  Press 'R' to return to the main menu or Press 'Q' to start the game", textX, textX + (11*gapY));
    
    
}


