/*
  author: Christian Bender
  This file contains the class Schiff (german for ship) and the
  enumeration type Status.
*/

enum Status {
  ON, OFF, GETROFFEN, MENSCH, PC, UNDEF, MARK
};

class Schiff
{
  private float xLoc;
  private float yLoc;
  private float edge;
  private Status status;
  private Status is;
  private PImage img;

  public Schiff()
  {
    this.xLoc = 0;
    this.yLoc = 0;
    this.status = Status.OFF;
    is = Status.UNDEF;
    edge = 50;
    img = loadImage("img/ship.png");
  }

  public Schiff(float xLoc, float yLoc)
  {
    this.xLoc = xLoc;
    this.yLoc = yLoc;
    this.status = Status.OFF;
    is = Status.UNDEF;
    edge = 50;
    img = loadImage("img/ship.png");
  }

  public Status getStatus()
  {
    return status;
  }

  public Status getIS()
  {
    return is;
  }

  public void turnOn(Status s)
  {

    status = Status.ON;
    is = s;
  }

  public void turnOff(Status s)
  {

    status = Status.OFF;
    is = s;
  }

  public void destroyed()
  {
    status = Status.GETROFFEN;
  }

  public void display()
  {
    final float EDGE = 50;
    final float HALFEDGE = EDGE / 2.0;
    if (status == Status.ON)
    {
      fill(0);
      stroke(10, 48, 193);
      rect(xLoc, yLoc, EDGE, EDGE);
      if (is == Status.MENSCH) // displays ship if ship is own of player.
      {
        //fill(255, 0, 0);
        //ellipse(xLoc+HALFEDGE, yLoc+HALFEDGE, HALFEDGE, HALFEDGE);
        image(img, xLoc, yLoc);
      }
    } else if (status == Status.OFF)
    {
      fill(0);
      stroke(10, 48, 193);
      rect(xLoc, yLoc, EDGE, EDGE);
    } else if (status == Status.GETROFFEN)
    {
      fill(0);
      stroke(10, 48, 193);
      rect(xLoc, yLoc, EDGE, EDGE);
      if (is == Status.MENSCH)
      {
        stroke(255, 0, 0);
      } else if (is == Status.PC)
      {
        stroke(0, 0, 255);
      }
      line(xLoc, yLoc, xLoc+EDGE, yLoc+EDGE);
      line(xLoc, yLoc+EDGE, xLoc+EDGE, yLoc);
    } else if (status == Status.MARK)
    {
      if (is == Status.MENSCH)
      {
        fill(255, 0, 0);
      } else 
      {
        fill(0, 0, 255);
      }
      stroke(10, 48, 193);
      rect(xLoc, yLoc, EDGE, EDGE);
    }
  }

  public boolean click()
  {
    if ((mouseX >= xLoc) && (mouseX <= xLoc + edge)
      && (mouseY >= yLoc) && (mouseY <= yLoc + edge))
    {
      return true;
    } else
    {
      return false;
    }
  }

  public void mark(Status s)
  {
    if (is == Status.UNDEF)
    {
      status = Status.MARK;
      is = s;
    }
  }
}