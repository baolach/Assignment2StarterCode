/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Use translations and rotations
    push and pop matrix
    

   add a highscore and quickest time
   OR 
   have a 3 level thing
 
    cassie has to be infront of the ladder and levels
    be able to select different dogs/players
    add in a barking sound when she gets hit
 
    
    what can gameObject class do?
   
*/

ArrayList<GameObject> objects = new ArrayList<GameObject>(); // an array list of objects . ie. a number of objects that can be reference by object.get(i)
boolean[] keys = new boolean[526];
PImage cassie;
PImage ladder;
PImage ball;


int numFrames = 2;  // The number of pictures in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
PImage[] images2 = new PImage[numFrames];
PImage[] climb = new PImage[numFrames];

int level = 0;

import ddf.minim.*;
Minim minim;
AudioPlayer bark;



Level ground = new Level(0,650,650,650); // ground level
Level levelOne = new Level( 0,520,650,520); // first level
Level levelTwo = new Level( 0,400,650,400); // second level
Level levelThree = new Level( 0,280,650,280); // Third level
Level levelTop = new Level(0,160,650,160); // Top level

Ladder ladder1 = new Ladder(550, 475); // 1st ladder
Ladder ladder2 = new Ladder(100, 345); // 2nd ladder
Ladder ladder3 = new Ladder(500, 225); // 3rd ladder
Ladder ladder4 = new Ladder(130, 105); // 4th ladder

//Green green1 = new Green(100,100); // 1st green bone









void setup()
{
  size(650, 650);
  frameRate(37);

  setUpPlayerControllers();
  ladder = loadImage("ladder.png");
  cassie = loadImage("cassie.png");
  ball = loadImage("ball.png");
   
  // adds in the objects
  objects.add(ground);
  objects.add(levelOne);
  objects.add(levelTwo);
  objects.add(levelThree);
  objects.add(levelTop);
  
   objects.add(ladder1);
   objects.add(ladder2);
   objects.add(ladder3);
   objects.add(ladder4);
   
  //objects.add(green1);
 
 // minim = new minum(this);
  //bark = minim.loadFile("bark.mp3"); 


  
  images[0] = loadImage("walking2.png");
  images[1] = loadImage("walking1.png"); 
  
  images2[0]  = loadImage("walking2left.png");
  images2[1]  = loadImage("walking1left.png"); 
   
   climb[0]  = loadImage("climbing1.png"); 
   climb[1]  = loadImage("climbing2.png"); 

  
   
   


}

void draw()
{
    background(10);
    /*
    switch (level){
      case 0:
        levelOne.changePosition(30, 40. 40, 50);
        break;
       
      case 1:
        levelOne.chane
      } */

  
  for(GameObject object: objects)
  {
    object.update();
    object.display();
  }
}



void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(
            i
            , color(255,0,0)
            , playerXML);
          int x = (i + 1) * gap;
          p.pos.x = width / 15; // position of cassie
          p.pos.y = (height - (height / 7)) +5;
         objects.add(p);         
  }
}
