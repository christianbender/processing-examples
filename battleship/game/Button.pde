/*
  author: Christian Bender
  class-name: Button
  This class is represents a simple button for the UI.
*/

class Button
{
  private float xLoc;
  private float yLoc;
  private float w;
  private float h;
  private String label;
  private boolean status;
  private PImage spritesheet;
  private PImage [] imgs;
  private int index;

  public Button(float xLoc, float yLoc, String label)
  {
    this.xLoc = xLoc;
    this.yLoc = yLoc;
    this.label = label;
    w = 200;
    h = 50;
    status = true;
    
    index = 0;
    spritesheet = loadImage("img/buttons.png");
    imgs = new PImage[2];
    imgs[0] = spritesheet.get(0, 0, 256, 64);
    imgs[1] = spritesheet.get(0, 64, 256, 64);
  }

  public void display()
  {
    final float VERSATZ = 32;

    //fill(127);
    //rect(xLoc, yLoc, w, h);
    image(imgs[0], xLoc, yLoc);
    fill(0);
    textSize(25);
    text(label, xLoc+VERSATZ, yLoc+VERSATZ);
  }

  public void display0()
  {
    final float VERSATZ = 32;

    //fill(127);
    //rect(xLoc, yLoc, w, h);
    image(imgs[0], xLoc, yLoc);
    fill(0);
    textSize(25);
    text(label, xLoc+VERSATZ, yLoc+VERSATZ);
  }

  public void display1()
  {
    final float VERSATZ = 32;

    //fill(127);
    //rect(xLoc, yLoc, w, h);
    image(imgs[1], xLoc, yLoc);
    fill(0);
    textSize(25);
    text(label, xLoc+VERSATZ, yLoc+VERSATZ);
  }

  public boolean click()
  {
    if (status && (mouseX >= xLoc) && (mouseX <= xLoc+w) 
      && (mouseY >= yLoc) && (mouseY <= yLoc + h))
    {
      index = 1;
      return true;
    } else
    {
      index = 0;
      return false;
    }
  }

  public void lock()
  {
    status = false;
  }

  public void unlock()
  {
    status = true;
  }
}