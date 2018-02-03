/*
    author: Christian Bender
 This program is a simple simulation of a projectile flight path.
 You start the projectile flight with key S
 You end the projectile flight with key E
 You reset the projectile flight with key R
 */

Projectile proj;

// flag for controlling the flight of the projectile.
boolean start = false;

// fall bound
final float BOUND = 200;

void setup()
{
  size(500, 400, P2D);
  background(#7673DB);
  proj = new Projectile(12.5, 100, 25,BOUND);
}


void draw()
{
  background(#7673DB);
  
  // part of the UI 
  fill(0);
  textSize(20);
  text("start with key S",0,20);
  text("end with key E",0,40);
  text("reset with key R",0,60);
  
  // displays the projectile on the screen
  proj.display();
  
  // draws the absolute fall limit.
  line(0,BOUND,500,BOUND);
  
  // controlling the flight
  if (start)
  {
    // slow down the animation
    if (frameCount % 30 == 0)
    {
      proj.move();
    }
  }
}

// s for start
// e for end
// r for reset
void keyPressed()
{
  switch (key)
  {
    case 's':
    case 'S':
      start = true;
      break;
    case 'e':
    case 'E':
      start = false;
      break;
    case 'r':
    case 'R':
      proj.reset();
      start = false; // turn off the simulation
      break;
  }
}