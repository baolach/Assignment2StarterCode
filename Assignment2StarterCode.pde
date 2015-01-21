/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Use translations and rotations
    push and pop matrix
    
    the Level levelOne = new Level(dfdfsfds) can be different to the co ordinates of the line in the Level tab <<<< None of them seem to matter
    what does the add.objects in setup on this page do?
    
    I cant change the pos.x to the bottom left corner
    
    
    
    Add in ladder using vectors and not just positions
   
*/

ArrayList<GameObject> objects = new ArrayList<GameObject>(); // an array list of objects . ie. a number of objects that can be reference by object.get(i)
boolean[] keys = new boolean[526];
PImage cassie;
PImage ladder;
PImage food;


int numFrames = 2;  // The number of pictures in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
PImage[] images2 = new PImage[numFrames];


Level levelOne = new Level(0,650,650,650); // this creates the object





void setup()
{
  size(650, 650);
  setUpPlayerControllers();
  cassie = loadImage("cassie.bmp");
  ladder = loadImage("ladder.bmp");
  food = loadImage("food.bmp");



  
  
  frameRate(37);
  images[0] = loadImage("walking2.bmp");
  images[1] = loadImage("walking1.bmp"); 
  
  images2[0]  = loadImage("walking2left.bmp");
  images2[1]  = loadImage("walking1left.bmp"); 
  

  
  objects.add(levelOne);
}

void draw()
{
    background(10);

  
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
