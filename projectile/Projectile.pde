/*
 author: Christian Bender
 class-name: Projectile
 This is a simple class for representing a projectile.
 */

public class Projectile
{
  // represents the vilocity in x- and y-dimension.
  private float xVel = 50;
  
  private float noteXVel;

  // represents the location of the projectile.
  private float xLoc = 0;
  private float yLoc = 0;
  
  // notice the orginal location
  private float noteXLoc;
  private float noteYLoc;

  // represents the radius of the projectile 
  private float rad = 0;

  // counts the calls of the move-method.
  // uses in the s(...) and v(...) method.
  private float counter = 0;

  // gravity 
  private final float G = 0.8;

  // fall limit
  private float bound = 0;

  // constructor
  public Projectile(float xLoc, float yLoc, float rad, float bound)
  {
    this.xLoc = xLoc;
    this.yLoc = yLoc;
    
    // notices the location
    noteXLoc = xLoc;
    noteYLoc = yLoc;
    
    this.rad = rad;
    this.bound = bound;
    
    // notices the velocity in x-dimension.
    noteXVel = xVel;
  }

  // helper method for calculating the height of the projectile
  private float s(float t)
  {
    return (G * ((t*t)/2.0));
  }

  // helper method for calculating the vilocity of the projectile
  private float v(float t)
  {
    return -G * t;
  }

  // display: draws the projectile
  public void display()
  {
    fill(250, 8, 8);
    ellipse(xLoc, yLoc, rad, rad);
  }

  // move: moves the projectile along the x-dimension.
  public void move()
  {
    // make sure: 
    // projectile isn't under the fall limit(bound). 
    // projectile isn't out of bounding. 
    // velocity in x-dimension isn't negative.
    if ((yLoc < bound-rad) && (xLoc < (width-rad)) && (xVel > 0))
    {
      yLoc = yLoc + s(counter); //<>//
      xLoc += xVel;
      xVel += v(counter);
    }

    counter++;
  }
  
  // reset: resets the simulation 
  public void reset()
  {
    xLoc = noteXLoc;
    yLoc = noteYLoc;
    xVel = noteXVel;
    counter = 0;
  }
}