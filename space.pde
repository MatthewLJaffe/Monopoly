public class space
{
  protected String name = "";
  protected int x = 0;
  protected int y = 0;
  protected int w = 0;
  protected int h = 0;
  

  
  public space(int isX, int isY,int isW,int isH, String isName)
  {
    name = isName;
    x = isX;
    y = isY;
    w = isW;
    h = isH;
    rect(x,y,w,h);
  }
  public space(int isX, int isY,int isW,int isH)
  {
    x = isX;
    y = isY;
    w = isW;
    h = isH;
    rect(x,y,w,h);
  }

   public space()
   {}
   
   public void setName(String n)
   {
     name = n;
   }
   
   public String getName()
   {
     return name;
   }
   
   
   public int getX()
   {
     return x;
   }
   
   public int getY()
   {
     return y;
   }
   
   public int getW()
   {
     return w;
   }
   
   public int getH()
   {
     return h;
   }
   
   //placeholder propspace methods
   public boolean getOwned()
   {
     return false;
   }
   public void setOwn(boolean b)
   {}
   public int getPrice()
   {
     return 0;
   }
   public int getCost()
   {
     return 0;
   }
   public void setCost(int a)
   {}
   public String getColor()
   {
     return "";
   }
   public void setOwnColor(String s)
   {}
   public String getOwnColor()
   {
     return "";
   }
   public int getHouses()
   {
     return 0;
   }
   public String getType()
   {
     return "";
   }
   public void setHouses(int i)
   {}
   public void setMortgaged(boolean b)
   {}
   public boolean getMortgaged()
   {
     return false;
   }
   public void setStartingCost(int i)
   {}
   public int getStartingCost()
   {
     return 0;
   }

  public void update()
  {
    fill(207,255,224);
    rect(x,y,w,h);
  }
  
  public String toString()
  {
    return x + " " + y + " " + w + " " + h;
  }
  
}
