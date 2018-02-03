/*
    author: Christian Bender
    class-name: Zelle
    This class implements a cell for the conways game of life.
*/
public class Zelle
{

  // current state of the cell.
  private boolean beAlive;
  
  // location of the cell
  private float xLoc;
  private float yLoc;
  
  // dimensions of the cell.
  private float edgeLength;

  // default constructor for the use of the class as array type.
  public Zelle ()
  {
    xLoc = 0;
    yLoc = 0;
    edgeLength = 10;
    beAlive = false;
  }

  public Zelle(float xLoc, float yLoc, float edgeLength)
  {
    this.xLoc = xLoc;
    this.yLoc = yLoc;
    this.edgeLength = edgeLength;
    this.beAlive = false; // To begin the cell is dead.
  }

  // sets the state of the current cell
  public void setState(boolean status)
  {
    beAlive = status;
  }

  // returns the state
  public boolean getState()
  {
    return beAlive;
  }

  // displays the cell black if the cell is dead, otherwise red.
  public void display()
  {
    if (beAlive)
    {
      fill(255, 0, 0);
    } else 
    {
      fill(0);
    }
    stroke(11, 93, 222);
    rect(xLoc, yLoc, edgeLength, edgeLength);
  }

  /*
    getter methods for the coordinates.
  */
  
  public float getX()
  {
    return xLoc;
  }

  public float getY()
  {
    return yLoc;
  }
}