public class propspace extends space
{
  protected int price = 200;
  protected int cost = 25;
  protected String Color = "black";
  protected boolean owned = false;
  protected String ownColor = "";
  protected int houses = 0;
  protected boolean mortgaged = false;
  protected int startingCost;
  
  public propspace()
  {}

  public propspace(int isx, int isy, int isw, int ish,String isName)
  {
    super(isx,isy,isw,ish,isName);
  }
  
  public propspace(int isx, int isy, int isw, int ish, int isPrice, int isCost, String isColor, String isName)
  {
    super(isx,isy,isw,ish,isName);
    price = isPrice;
    cost = isCost;
    Color = isColor;
  }
  
  
  public void setCost(int a)
  {
    cost = a;
  }
  public int getCost()
  {
    return cost;
  }
  public int getPrice()
  {
    return price;
  }
  public boolean getOwned()
  {
    return owned;
  }
  public void setOwn(boolean b)
  {
    owned = b;
  }
  public String getColor()
  {
    return Color;
  }
  public void setOwnColor(String c)
  {
    ownColor = c;
  }
  public String getOwnColor()
  {
    return ownColor;
  }
  public int getHouses()
  {
    return houses;
  }
  public void setHouses(int i)
  {
    houses = i;
  }
  public void setStartingCost(int i)
  {
    startingCost = i;
  }
  public int getStartingCost()
  {
    return startingCost;
  }
  public void setMortgaged(boolean b)
  {
    mortgaged = b;
  }
  public boolean getMortgaged()
  {
    return mortgaged;
  }


  
  public String toString()
  {
    return Color + " " + name+" "+owned;
  }
}
