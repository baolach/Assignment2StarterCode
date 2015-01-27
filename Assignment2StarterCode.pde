/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
 
    timer doesnt reset
    instructions still doesnt work after the start menu
 
        
    comment!!!
   have cat throwstuff
   
   have option for different colours
   fix cassie walking
   cassie infront of laddesr
   score  reset
   when you reach the ball have a celebration
*/

ArrayList<GameObject> objects = new ArrayList<GameObject>(); // an array list of objects . ie. a number of objects that can be reference by object.get(i)
boolean[] keys = new boolean[526];
PImage cassie;
PImage ladder;
PImage ball;
PImage bone;
PImage start;
PImage instructs;
PImage instructions;
PImage sleep;
int level = 0;



int numFrames = 2;  // The number of pictures in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
PImage[] images2 = new PImage[numFrames];
PImage[] climb = new PImage[numFrames];
PImage[] sleeping = new PImage[numFrames];


int num = 1; // how many on the screen at once
int[] Xfall = new int[num]; // x position of things falling
int[] Yfall = new int[num]; // y position of things falling
float speed = 1;
int lives = 1;
int i;
int f = 650;
int time;

boolean startscreen = true;
boolean instructions_bool = false;



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
  bone = loadImage("bone.png");
  start = loadImage("start.jpg");
  instructs = loadImage("instructs.png");
  instructions = loadImage("blur.jpg");
  sleep = loadImage("sleep.png");

   
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
 
  minim = new Minim(this);



  
  images[0] = loadImage("walking2.png");
  images[1] = loadImage("walking1.png"); 
  
  images2[0]  = loadImage("walking2left.png");
  images2[1]  = loadImage("walking1left.png"); 
   
   climb[0]  = loadImage("climbing1.png"); 
   climb[1]  = loadImage("climbing2.png"); 
   
   sleeping[0]  = loadImage("sleep.png"); 
   sleeping[1]  = loadImage("sleep2.png"); 

}

void draw()
{
    background(10);
  
  if( startscreen == true)
  {
    startscreen();
  }
  else if( startscreen == false && instructions_bool == false && lives != 0)
  {
    for(GameObject object: objects)
    {
      object.update();
      object.display();
      fall();
      
    }
  }
  else if( lives == 0 || lives < 0)
  {
    endscreen();
    time = 0;
  }
  else if(instructions_bool = true)
  {
    instructions();
  }
  
  
  
 
  
 
}// end draw



void keyPressed()
{
  keys[keyCode] = true;
  
   if( (key == 't') || (key == 'T'))
   {
     exit();
   }
   if( (key == 'e') || (key == 'E'))
   {
     startscreen = false;
     instructions_bool = true;
   }
   if( (key == 'q') || (key == 'Q'))
   {
     startscreen = false;
     instructions_bool = false;
     frameRate(37); //sets framerate back to 37 as on the endscreen the speed is slowed down to 1
     lives = 3;
     time = 0;
   }
   if( (key == 'r') || (key == 'R'))
   {
     startscreen = true;
     time = 0;
   }
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
