/*
  author: Christian Bender
  This file contains the main program for the battleship game.
*/

Welt welt;
Button start;
Button beenden;
Button fertig;

// enumeration type for flags.
enum Flag {
  BEREITSCHAFT, NEWGAME, EXITGAME, POSITIONIERUNG, RATEN
};

// enumeration type for variable error
enum Error { 
  POSERROR, OK
};

// flag variables for control flow.
Flag flag;
Flag flag2;

// for error handling
Error error;

// notice won or lose
// type Status in file Schiff.pde
Status won;

void setup()
{
  size(500, 600);
  background(255);
  frameRate(30);

  flag = Flag.BEREITSCHAFT;
  flag2 = Flag.POSITIONIERUNG;

  error = Error.OK;

  won = Status.UNDEF;

  welt = new Welt(10);
  start = new Button(150, 150, "START");
  beenden = new Button(150, 214, "Exit");
  fertig = new Button(0, 500, "Done");
}

void draw()
{
  background(255);

  // display little menu
  if (flag == Flag.BEREITSCHAFT)
  {

    start.display();
    beenden.display();
    switch(won)
    {
    case MENSCH:
      fill(0);
      textSize(50);
      text("You won!", 150, 150);
      break;
    case PC:
      fill(0);
      textSize(50);
      text("You lose!", 150, 150);
      break;
    }
  } else if (flag == Flag.NEWGAME) // choices game
  {
    welt.display();
    fertig.unlock();
    won = Status.UNDEF;
    if (flag2 == Flag.POSITIONIERUNG)
    {
      fertig.display();
    }
  } else
  {
    fill(0);
    textSize(50);
    text("ENDE", 150, 150);
  }

  switch (error)
  {
  case POSERROR:
    fill(0);
    textSize(20);
    text("Zu wenig Schiffe", 260, 550);
    break;
  }
}

void mouseClicked()
{
  if (mouseButton == LEFT)
  {
    if (start.click())
    {
      start.display1(); // for button animation.
      flag = Flag.NEWGAME; 
      start.lock();
      beenden.lock();
    } 

    if (beenden.click())
    {
      beenden.display1(); // for button animation.
      flag = Flag.EXITGAME;
      start.lock();
      beenden.lock();
    } 

    if (flag == Flag.NEWGAME)
    {
      if (flag2 == Flag.POSITIONIERUNG)
      {
        welt.setShip();
      } else if (flag2 == Flag.RATEN)
      {
        welt.guess();
        switch(welt.won())
        {
        case MENSCH:
          flag = Flag.BEREITSCHAFT;
          flag2 = Flag.POSITIONIERUNG;
          start.unlock();
          beenden.unlock();
          won = Status.MENSCH;
          welt.reset();
          break;
        case PC:
          flag = Flag.BEREITSCHAFT;
          flag2 = Flag.POSITIONIERUNG;
          start.unlock();
          beenden.unlock();
          won = Status.PC;
          welt.reset();
          break;
        }
      }

      if (fertig.click())
      {
        fertig.display1(); // for button animation.
        if (welt.getNumShips() == welt.MAX())
        {
          fertig.lock();
          flag2 = Flag.RATEN;
          error = Error.OK;
          welt.createShipsForPC();
        } else 
        {
          error = Error.POSERROR;
        }
      } 
    }
  }
}