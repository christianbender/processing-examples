/* Ball class -- by Christian Bender
 implements a ball class with simple collision detection.
 */
class Ball
{

  private float xLoc;                            // x coordinate of that ball
  private float yLoc;                            // y coordinate of that ball
  private float xVel;                            // velocity in x dimension
  private float yVel;                            // velocity in y dimension
  private float diameter;                        // diameter of that ball
  private float rad;                             // radius of that ball
  private final float FACTOR = -1.0;             // speed factor


  Ball (float xLoc, float yLoc, float xVel, float yVel, float diameter)
  {

    this.xLoc = xLoc;
    this.yLoc = yLoc;
    this.xVel = xVel;
    this.yVel = yVel;
    this.diameter = diameter;
    this.rad = diameter / 2;
  }

  void display()                      // displays this ball.
  {
    fill(234, 7, 75);
    ellipse(xLoc, yLoc, diameter, diameter);
  }

  void move()                         // moves this ball, inclusive collision detection for walls.
  {
    xLoc += xVel;
    yLoc += yVel;

    // bounces off walls.
    // left and right wall
    if (xLoc <=  rad)                 // bounces off left wall
    {

      if (xVel < 0)
      {
        xVel *= FACTOR;
      }
    } else if (xLoc >= (width - rad))
    {

      if (xVel > 0)
      {
        xVel *= FACTOR;
      }
    }


    // top and bottom wall
    if (yLoc <= rad)                    // bounces off top wall.
    {
      if (yVel < 0)
      {
        yVel *= FACTOR;
      }
    } else if (yLoc >= (height-rad))    // bounces off bottom wall.
    {

      if (yVel > 0)
      {
        yVel *= FACTOR;
      }
    }
  }

  // some getter and setter methods.
  float getX()
  {
    return xLoc;
  }

  float getY()
  {
    return yLoc;
  }

  float getXV()
  {
    return xVel;
  }

  float getYV()
  {
    return yVel;
  }

  void setXVel(float xV)
  {
    xVel = xV;
  }

  void setYVel(float yV)
  {
    yVel = yV;
  }

  
  boolean collide(Ball ball)          // collision detection for collision with other balls.
  {

    float xV1 = xVel;
    float yV1 = yVel;
    float xV2 = ball.getXV();
    float yV2 = ball.getYV();
    float m1 = 10;
    float m2 = 5;

    if (dist(xLoc, yLoc, ball.getX(), ball.getY()) <= diameter)
    {

      xVel = (xV1 *(m1-m2) + (2* m2 * xV2)) / (m1+m2);
      yVel = (yV1 *(m1-m2) +(2*m2*yV2)) / (m1+m2);
      ball.setXVel((xV2 * (m2 - m1) + (2*m1*xV1)) / (m1+m2));
      ball.setYVel((yV2 * (m2 - m1) + (2*m1*yV1)) /(m1+m2));

      return true;
    } else 
    {

      return false;
    }
  }
}