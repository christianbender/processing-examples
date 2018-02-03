/*
  author: Christian Bender
  This program implements the conways game of life simulation.
  Key V fills random the field.
  Key ENTER starts the simulation. One round per second.
  Wiht ENTER you can stop the simulation, too.
  You can pick each cell with a mouse click.
  With key R you can execute a fix number of simulation-rounds. 
  The number of rounds can you manipulate with UP and DOWN keys.
*/


Welt welt;
int N;      // number of simulations

// should runs one simulation per second?
boolean fortlaufend;

void setup()
{
  size(500, 500);
  background(255);

  N = 1; 

  fortlaufend = false;

  welt = new Welt(20, 25);
}

void draw()
{
  background(255);

  welt.display();

  fill(255);
  text("number of simulations: " + N, 0, 25);

  if (fortlaufend)
  {
    if (frameCount % 60 == 0)
    {
      welt.simulation(1);
    }
  }
}

void keyPressed()
{
  switch (keyCode)
  {
  case UP:
    N++;
    break;
  case DOWN:
    if (N - 1  > 0)
    {
      N--;
    }
    break;
  case ENTER:
    if (fortlaufend)
    {
      fortlaufend = false;
    } else
    {
      fortlaufend = true;
    }
    break;
  }

  switch (key)
  {
  case 'v':
    welt.configure();
    break;
  case 'r':
    welt.simulation(N);
    break;
  }
}

void mouseClicked()
{
  Zelle zelle = null;
  if (mouseButton == LEFT && !fortlaufend)
  {
    zelle = welt.collide(mouseX, mouseY);
    if (zelle != null)
    {
      if (zelle.getState())
      {
        zelle.setState(false);
      } else 
      {
        zelle.setState(true);
      }
    }
  }
}