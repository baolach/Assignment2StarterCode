/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];
PImage cassie;

int numFrames = 2;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
PImage[] images_images = new PImage[numFrames];





void setup()
{
  size(500, 500);
  setUpPlayerControllers();
  background(6);
  cassie = loadImage("cassie.bmp");
  
  
  frameRate(37);
  images[0]  = loadImage("walking2.bmp");
  images[1]  = loadImage("walking1.bmp"); 
  
  images_images[0]  = loadImage("walking2left.bmp");
  images_images[1]  = loadImage("walking1left.bmp"); 

}

void draw()
{
  for(Player player:players)
  {
    player.update();
    player.display();

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
          p.pos.x = x;
          p.pos.y = 300;
         players.add(p);         
  }
}
