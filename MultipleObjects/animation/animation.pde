/* animation multiple objects --- by Christian Bender
*/

World world;                        // animation world


void setup()
{

  size(500, 500);
  background(255);

  world = new World(1, 10);        // init world with one ball and a diameter of 10.
}

void draw()
{
  background(255);

  world.display();                      // displaying the world
  world.move();                         // move the balls
  world.checkCollides();                // check whether balls collides each other

  fill (0);
  textSize(18);
  text("number of balls: " + world.size(), 200, 250);
  text("number of collisions: " + world.getNumCollisions(), 200, 270);
}

void keyPressed()                      // for adding and removing balls 
{
  switch (key)
  {

  case '+':

    world.addBall();                  // add one ball to the world.
    break;
  case '-':
    if (world.size() > 1)
    {

      world.killBall();              // remove one ball from the world.
    }
    break;
  }
}

void mousePressed()                    // for adding balls with mouse
{
  if (mouseButton == LEFT)
  {
    world.addBall(mouseX, mouseY);
  }
}