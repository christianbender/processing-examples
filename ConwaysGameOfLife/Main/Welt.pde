/*
  author: Christian Bender
  class-name: Welt 
  This class represents the world of the conways game of life.
  In addition the class contains all cells.
*/

public class Welt
{

  private Zelle [][] field;
  
  // contains the number of alive cells.
  private int numAliveCells;
  
  // dimension of the world dimension x dimension (NxN)
  private int dimension;
  private float edgeLength;

  public Welt(int N, float edgeLength)
  {
    field = new Zelle[N][N];
    numAliveCells = 0;
    Zelle zelle = null;
    dimension = N;
    this.edgeLength = edgeLength;

    // initialize the field.
    for (int i = 0; i < N; i++)
    {
      for (int j = 0; j < N; j++)
      {
        zelle = new Zelle(i * edgeLength, j * edgeLength, edgeLength);
        field[i][j] = zelle;
      }
    }
  }

  public boolean getStateOfCell (int i, int j)
  {
    return field[i][j].getState();
  }

  // sets the state of a selected (i,j) cell.
  public void setStateOfCell(int i, int j, boolean state)
  {
    if (state)    // for counting the alive cells.
    {
      numAliveCells++;
    } else 
    {
      numAliveCells--;
    }
    field[i][j].setState(state);
  }

  // returns the number of alive cells.
  public int getNumAliveCells()
  {
    return numAliveCells;
  }

  // display: displays the world
  public void display()
  {
    for (int i = 0; i < dimension; i++)
    {
      for (int j = 0; j < dimension; j++)
      {
        field[i][j].display();
      }
    }
  }

  // runs N simulations
  public void simulation (int N)
  {
    Zelle zelle = null;
    int neighbors = 0;

    for (int k = 0; k < N; k++)
    {

      // actual simulation

      for (int i = 0; i < dimension; i++)
      {
        for (int j = 0; j < dimension; j++)
        {

          zelle = field[i][j];

          // determine number of alive neighbors

          if (i-1 >= 0) // top neighbor
          {
            if (field[i-1][j].getState())
            {
              neighbors++;
            }
          }

          if (i+1 < dimension) // bottom neighbor
          {
            if (field[i+1][j].getState())
            {
              neighbors++;
            }
          }

          if (j-1 >= 0) // left neighbor
          {
            if (field[i][j-1].getState())
            {
              neighbors++;
            }
          }

          if (j+1 < dimension) // right neighbor
          {
            if (field[i][j+1].getState())
            {
              neighbors++;
            }
          }

          if ((j-1 >= 0) && (i-1 >= 0)) // upper left neighbor
          {
            if (field[i-1][j-1].getState())
            {
              neighbors++;
            }
          }

          if ((j+1 < dimension) && (i-1 >= 0)) // upper right neighbor
          {
            if (field[i-1][j+1].getState())
            {
              neighbors++;
            }
          }

          if ((j-1 >= 0) && (i+1 < dimension)) // under left neighbor
          {
            if (field[i+1][j-1].getState())
            {
              neighbors++;
            }
          }

          if ((j+1 < dimension) && (i+1 < dimension)) // under right neighbor
          {
            if (field[i+1][j+1].getState())
            {
              neighbors++;
            }
          }

          if (neighbors > 3)
          {
            if (zelle.getState())
            {
              zelle.setState(false);
              numAliveCells--;
            }
          } else if (neighbors == 2 || neighbors == 3)
          {
            if (neighbors == 3 && !zelle.getState())
            {
              zelle.setState(true);
              numAliveCells++;
            }

            if (zelle.getState())
            {
              zelle.setState(true);
            }
          } else if (neighbors < 2)
          {
            if (zelle.getState())
            {
              zelle.setState(false);
              numAliveCells--;
            }
          }

          neighbors = 0;
        }
      }
    }
  }

  // fills random the field with alive cells.
  public void configure()
  {
    float value = 0;
    for (int i = 0; i < dimension; i++)
    {
      for (int j = 0; j < dimension; j++)
      {
        value = random(1);
        if ( value >= 0.5 && value <= 0.7 )
        {
          field[i][j].setState(true);
        }
      }
    }
  }
  
  /*
    This method is important for selecting the cells with the mouse.
  */
  public Zelle collide(float x, float y)
  {
    Zelle zelle = null;
    float xM = 0;
    float yM = 0;
    for (int i = 0; i < dimension; i++)
    {
      for (int j = 0; j < dimension; j++)
      {
        zelle = field[i][j];

        xM = zelle.getX() + (edgeLength / 2.0);
        yM = zelle.getY() + (edgeLength / 2.0);

        if (dist(xM, yM, x, y) <= sqrt(2*(edgeLength / 2.0)*(edgeLength / 2.0)))
        {
          return zelle;
        }
      }
    }

    return null;
  }
}