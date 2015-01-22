/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Use translations and rotations
    push and pop matrix
    

 
 
    cassie has to be infront of the ladder and levels
   
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

Level ground = new Level(0,650,650,650); // ground level
Level levelOne = new Level( 0,520,650,520); // first level
Level levelTwo = new Level( 0,400,650,400); // second level
Level levelThree = new Level( 0,280,650,280); // Third level
Level levelTop = new Level(0,160,650,160); // Top level

Ladder ladder1 = new Ladder(550, 475); // Top level
Ladder ladder2 = new Ladder(100, 345); // Top level
Ladder ladder3 = new Ladder(500, 225); // Top level
Ladder ladder4 = new Ladder(130, 105); // Top level








void setup()
{
  size(650, 650);
  setUpPlayerControllers();
  ladder = loadImage("ladder.bmp");
  cassie = loadImage("cassie.bmp");
  ball = loadImage("ball.png");



  
  
  frameRate(37);
  images[0] = loadImage("walking2.bmp");
  images[1] = loadImage("walking1.bmp"); 
  
  images2[0]  = loadImage("walking2left.bmp");
  images2[1]  = loadImage("walking1left.bmp"); 
   
   climb[0]  = loadImage("climbing1.bmp"); 
   climb[1]  = loadImage("climbing2.bmp"); 
   
   
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
          p.pos.y = height - (height / 7);
         objects.add(p);         
  }
}
