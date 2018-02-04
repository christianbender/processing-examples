/*
  author: Christian Bender
  class-name: Welt (german for world)
  This class represents the game world. 
*/

class Welt
{
  private Schiff [][] map;
  private int N;
  private int numShips;     // player ships.
  private int pcShips;
  private final int MAXSHIPS = 5;

  public Welt(int N)
  {
    this.N = N;
    numShips = 0;

    map = new Schiff[N][N];

    Schiff schiff = null;

    for (int i = 0; i < N; i++)
    {
      for (int j = 0; j < N; j++)
      {

        schiff = new Schiff(50*i, 50*j);
        map[i][j] = schiff;
      }
    }
  }

  public void display()
  {
    for (int i = 0; i < N; i++)
    {
      for (int j = 0; j < N; j++)
      {
        map[i][j].display();
      }
    }
  }

  // player set his ships.
  public void setShip()
  {

    for (int i = 0; i < N; i++)
    {
      for (int j = 0; j < N; j++)
      {
        if (map[i][j].click())
        {
          if (map[i][j].getStatus() == Status.OFF)
          {
            if (numShips < MAXSHIPS)
            {
              map[i][j].turnOn(Status.MENSCH);
              numShips++;
            }
          } else 
          {
            map[i][j].turnOff(Status.UNDEF);
            numShips--;
          }
        }
      }
    }
  }

  public void createShipsForPC()
  {
    int counter = 0;
    float randVal = 0;
    for (int i = 0; i < N; i++)
    {
      for (int j = 0; j < N; j++)
      {

        if ((counter < MAXSHIPS) && (map[i][j].getIS() != Status.PC) && (map[i][j].getIS() != Status.MENSCH))
        {
          randVal = random(1);
          if (randVal >= 0.7 && randVal <= 0.9 )
          {
            if (map[i][j].getIS() != Status.MENSCH)
            {
              map[i][j].turnOn(Status.PC);
              counter++;
            }
          }
        }
      }
    }

    if (counter == 5)
    {
      pcShips = 5;
    } else
    {
      throw new RuntimeException("...to little ships!");
    }
  }

  public void guess()
  {
    Schiff schiff = null;
    int count = 0;
    for (int i = 0; i < N; i++)
    {
      for (int j = 0; j < N; j++)
      {
        schiff = map[i][j];
        if (schiff.click())
        {
          if (schiff.getIS() == Status.PC)
          {
            if (schiff.getStatus() == Status.ON)
            {

              schiff.destroyed();
              pcShips--;
            }
          } else
          {
            schiff.mark(Status.MENSCH);
          }

          // pc guesses a ship.

          while (count < 1)
          {
            schiff = map[(int)random(N)][(int)random(N)];
            while ((schiff.getIS() == Status.PC) || (schiff.getStatus() == Status.MARK)
              && (schiff.getStatus() == Status.GETROFFEN))
            {
              schiff = map[(int)random(N)][(int)random(N)];
            }
            if (schiff.getIS() == Status.MENSCH)
            {
              if (schiff.getStatus() == Status.ON)
              {

                schiff.destroyed();
                count++;
                numShips--;
              }
            } else
            {
              schiff.mark(Status.PC);
              count++;
            }
          }
          
          assert(count == 1);
          count = 0;
        }
      }
    }
  }

  public int getNumShips()
  {
    return numShips;
  }

  public int MAX()
  {
    return MAXSHIPS;
  }

  public Status won()
  {
    if (pcShips == 0)
    {
      return Status.MENSCH;
    } 

    if (numShips == 0)
    {
      return Status.PC;
    }

    return Status.UNDEF;
  }


  public void reset()
  {
    Schiff schiff = null;
    for (int i = 0; i < N; i++)
    {
      for (int j = 0; j < N; j++)
      {

        schiff = new Schiff(50*i, 50*j);
        map[i][j] = schiff;
      }
    }

    numShips = pcShips = 0;
  }
}