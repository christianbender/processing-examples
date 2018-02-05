/* class World -- by Christian Bender
*/
class World
{

  private ArrayList<Ball> balls;                  // container for balls 
  private float diameter;                         // diameter of one ball.
  private float rad;                              // radius of one ball.
  private int numCollisions;                      // counter variable for counts collisions.

  World (int number, float diameter)
  {

    if (number >= 1)                             // It must be at least one ball contain in the world.
    {
      balls = new ArrayList<Ball>();
      Ball ball = null;
      this.diameter = diameter;
      this.rad = diameter / 2;
      this.numCollisions = 0;

      float rad = diameter / 2;

      for (int i=0; i < number; i++)
      {

        ball = new Ball(random(rad, width-rad), random(rad, height-rad), random(-3, 3), random(-3, 3), diameter);
        balls.add(ball);
      }
    } else 
    {
      throw new RuntimeException("... min. one ball!");
    }
  }

  void display()                                   // displays each ball 
  {
    for (Ball ball : balls)
    {

      ball.display();
    }
  }

  void move()                                      // moves each ball.
  {
    for (Ball ball : balls)
    {

      ball.move();
    }
  }

  void addBall()                                  // adds one ball to the container.
  {
    Ball ball = new Ball(random(rad, width-rad), random(rad, height-rad), random(-3, 3), random(-3, 3), diameter);
    balls.add(ball);
  }

  void killBall()                                 // removes one ball of the container.
  {
    balls.remove(balls.size() - 1);
  }

  void checkCollides()                            // checks collision each other by the balls.
  {
    
    for (int i =0; i < balls.size(); i++)
    {

      for (int j = i+1; j < balls.size(); j++)
      {
        if (balls.get(i).collide(balls.get(j)))
        {
          numCollisions++;
        }
      }
    }
  }

  int getNumCollisions()                            // gets number of collisions by the balls each other.
  {
    return numCollisions;
  }

  int size()                                        // gets number of balls in the container.
  {
    return balls.size();
  }

  void addBall(float x, float y)                  // add one ball by its x and y coordinates
  {
    Ball ball = new Ball(x, y, random(-3, 3), random(-3, 3), diameter);
    balls.add(ball);
  }
}