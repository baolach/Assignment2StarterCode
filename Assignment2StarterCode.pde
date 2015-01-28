/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Author: Baolach Morrison
    Student No: C13367911
    
    In this game you use the arrow to move nad climb up ladders to reach Cassie's (my dog who is a Rough Collie) favourite toy
    You must avoid the evil cats which fall from the sky
    You must be at the very top or very bottom of a ladder in order to move left or right off it
    You have 3 lives. If you get hit 3 times Cassie gets worn out and must have a nap
    Your time inscreases as the game goes on so you must complete in the lowest amount of time while not getting hit by the evil cats
        
*/

ArrayList<GameObject> objects = new ArrayList<GameObject>(); // an array list of objects 
boolean[] keys = new boolean[526];
PImage cassie;
PImage ladder;
PImage ball;
PImage cat;
PImage instructs;
PImage instructions;
PImage sleep;
PImage title;
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
int lives;
int i;
int f = 650;
int time;

boolean startscreen = true;


import ddf.minim.*;
Minim minim;
AudioPlayer bark;
AudioPlayer cheer;
AudioPlayer bkg;
AudioPlayer meow;


// gives objects their coordinates
Level ground = new Level(0,650,650,650); // ground level
Level levelOne = new Level( 0,520,650,520); // first level
Level levelTwo = new Level( 0,400,650,400); // second level
Level levelThree = new Level( 0,280,650,280); // Third level
Level levelTop = new Level(0,160,650,160); // Top level

Ladder ladder1 = new Ladder(550, 475); // 1st ladder
Ladder ladder2 = new Ladder(100, 345); // 2nd ladder
Ladder ladder3 = new Ladder(500, 225); // 3rd ladder
Ladder ladder4 = new Ladder(130, 105); // 4th ladder



void setup()
{
  size(650, 650);
  frameRate(37);
  
  setUpPlayerControllers();
  
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
   
 
  minim = new Minim(this);
  bkg = minim.loadFile("POL-floating-town-short.wav");//("EyeoftheTiger.mp3");
  bkg.play();
  bkg.loop();
  
  ladder = loadImage("ladder.png");
  cassie = loadImage("cassie.png");
  ball = loadImage("ball.png");
  cat = loadImage("cat.png");
  instructs = loadImage("instructs.png");
  sleep = loadImage("sleep.png");
  title = loadImage("image.png");


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
  else if( startscreen == false && lives != 0)
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
  }

}// end draw



void keyPressed()
{
  keys[keyCode] = true;
  
   if( (key == 't') || (key == 'T'))
   {
     exit();
   }
  
   if( (key == 'q') || (key == 'Q'))
   {
     startscreen = false;
     frameRate(37); //sets framerate back to 37 as on the endscreen the speed is slowed down to 1
     frameCount = 0;
     lives = 3;
   }
   
   if( (key == 'r') || (key == 'R'))
   {
     startscreen = true;
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
