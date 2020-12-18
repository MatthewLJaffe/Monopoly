public class piece
{
  protected int pieceX;
  protected int pieceY;
  private int radius;
  private int rval;
  private int gval;
  private int bval;
  protected int money;
  protected String name;
  private int doublesCounter = 0;
  protected int onSpace;
  private ArrayList<space> owns = new ArrayList<space>(0);
  private boolean utilityMonopoly = false;
  private boolean purpleMonopoly = false;
  private boolean lightBlueMonopoly = false;
  private boolean pinkMonopoly = false;
  private boolean oarngeMonopoly = false;
  private boolean redMonopoly = false;
  private boolean yellowMonopoly = false;
  private boolean greenMonopoly = false;
  private boolean blueMonopoly = false;
  private boolean youOwnSpace = false;
  private boolean startBuy = false;
  private boolean payUp = false;
  private boolean hasMonopoly = false;
  boolean chanceDraw = false;
  boolean communityChestDraw = false;
  boolean jail = false;
  int jailTime = 0;
  boolean freeCard = false;
  private ArrayList<space> propTrade = new ArrayList<space>(0);
  private int moneyTrade =0;
  private String offeredPlayer = "";
  private boolean tradeSubmit = false;


  
  public piece(int x, int y, int rad, int r, int g, int b, String player, int cash)
  {
    pieceX = x;
    pieceY= y;
    radius = rad;
    rval = r;
    gval = g;
    bval = b;
    money = cash;
    onSpace = 0;
    name = player;
    
    
    fill(r,g,b);
    ellipse(pieceX,pieceY,radius,radius);
  }
  public void move()
  {
    if (onSpace + diceNum + dice2Num > 39)
    {
      onSpace += (diceNum + dice2Num - 40);
      money +=200;
    }
    else
    {
      onSpace += (diceNum + dice2Num);
    }
    
    for(int i = 0; i < (diceNum + dice2Num); i++)
    {
      if( pieceY >= 610 && pieceX >= 106)
      {
        if( pieceX < 56+88 || pieceX > 592)
        {
          pieceX -= 72;
        }
        else
        {
          pieceX -= 56;
        }
      }
      else if( pieceY >= 88 && pieceX <= 88)
      {
        if (pieceY > 592)
        {
          pieceY -= 72;
        }
        else
        {
          pieceY -= 56;
        }
      }
      else if(pieceY < 88 && pieceX < 592)
      {
        if (pieceX < 88 || pieceX > 536)
        {
          pieceX += 72;
        }
        else
        {
          pieceX += 56;
        }
      }
      else
      {
        if( pieceY > 536)
        {
          pieceY += 72;
        }
        else
        {
          pieceY += 56;
        }
      }
    }
    
  }
  public void moveTo(int l)
  {
    int jumps = 0;
    if(l - onSpace > 0)
    {
      jumps = l - onSpace;
    }
    else
    {
      jumps = (l - onSpace) + 40;
      if(!jail)
      {
        money += 200;
      }
    }
    for(int i = 0; i < jumps; i++)
    {
      if( pieceY >= 610 && pieceX >= 106)
      {
        if( pieceX < 56+88 || pieceX > 592)
        {
          pieceX -= 72;
        }
        else
        {
        pieceX -= 56;
        }
      }
      else if( pieceY >= 88 && pieceX <= 88)
      {
        if (pieceY > 592)
        {
          pieceY -= 72;
        }
        else
        {
        pieceY -= 56;
        }
      }
      else if(pieceY < 88 && pieceX < 592)
      {
        if (pieceX < 88 || pieceX > 536)
        {
          pieceX += 72;
        }
        else
        {
          pieceX += 56;
        }
      }
      else
      {
        if( pieceY > 536)
        {
          pieceY += 72;
        }
        else
        {
          pieceY += 56;
        }
      }
    }
    onSpace = l;
  }
  
  public void runturn()
  {  
    if(jail)
    {
      jailTime += 1;
      println(jailTime);
      if(jailTime == 3)
      {
        jail = false;
        jailTime = 0;
      }
    }
    if (allSpaces.get(onSpace).getClass() == propspace.class||allSpaces.get(onSpace).getClass() == utilspace.class)
    {  
      if(allSpaces.get(onSpace).getOwned() == true)
      {
        println(true);
        for(int i = 0; i < owns.size(); i ++)
        {
          if(allSpaces.get(onSpace).getName().equals(owns.get(i).getName()))
          {
            youOwnSpace = true;
          }
        }
        if(!youOwnSpace && !allSpaces.get(onSpace).getMortgaged())
        {   
          println(money + "paying cost");
          money -= allSpaces.get(onSpace).getCost();
          println(money);
          payUp = true;   
        }
      }
      else
      {
        startBuy = true; //goes to main and puts in buy button
      }
    }
    youOwnSpace = false;
    
    communityChestDraw = false;
    chanceDraw = false;
    if(allSpaces.get(onSpace).getClass() == cardspace.class)
    {
      startDraw = true;
      if(allSpaces.get(onSpace).getType().equals("chance"))
      {
        chanceDraw = true;
      }
      
      if(allSpaces.get(onSpace).getType().equals("community chest"))
      {
        communityChestDraw = true;
      }
    }
    if(allSpaces.get(onSpace).name.equals("income tax"))
    {
      if (money *.1 > 200)
      {
        money -= 200;
      }
      else
      {
        money *= .9;
      }
    }
    if(allSpaces.get(onSpace).name.equals("luxury tax"))
    {
      money -= 75;
    }
    if(allSpaces.get(onSpace).name.equals("go to jail"))
    {
      jail = true;
      moveTo(10);
    }
  }
  
  public void checkMonopoly()
  {
    int util = 0;
    int RR = 0;
    int purple = 0;
    int lightBlue = 0;
    int pink = 0;
    int oarnge = 0;
    int red = 0;
    int yellow = 0;
    int green = 0;
    int blue = 0;
    
    for(int i = 0; i < owns.size(); i++)
    {
      if(owns.get(i).getColor().equals("rambow"))
      {
        util ++;
      }
      if(owns.get(i).getColor().equals("black"))
      {
        RR ++;
      }
      if(owns.get(i).getColor().equals("purple"))
      {
        purple ++;
      }
      if(owns.get(i).getColor().equals("light blue"))
      {
        lightBlue ++;
      }
      if(owns.get(i).getColor().equals("pink"))
      {
        pink ++;
      }
      if(owns.get(i).getColor().equals("oarnge"))
      {
        oarnge ++;
      }
      if(owns.get(i).getColor().equals("red"))
      {
        red ++;
      }
      if(owns.get(i).getColor().equals("yellow"))
      {
        yellow ++;
      }
      if(owns.get(i).getColor().equals("green"))
      {
        green ++;
      }
      if(owns.get(i).getColor().equals("blue"))
      {
        blue ++;
      }
    }
    
     for(int i = 0; i < owns.size(); i++)
    {
      if(owns.get(i).getColor().equals("black"))
      {
        if (RR == 2)
        {
          owns.get(i).setCost(50);
        }
        if (RR == 3)
        {
          owns.get(i).setCost(100);
        }
        if (RR == 4)
        {
          owns.get(i).setCost(200);
        }
      }
    }
    hasMonopoly = false;
    if( util == 2)
    {
      utilityMonopoly = true;
    }
    if( purple == 2)
    {
      purpleMonopoly = true;
      hasMonopoly = true;
      for(int i = 0; i < owns.size(); i++)
      {
        if(owns.get(i).getColor().equals("purple"))
        {
          if(owns.get(i).getCost() == owns.get(i).getStartingCost())
          {
            owns.get(i).setCost(owns.get(i).getCost() *2);
          }
          
        }
      }
    }
    if(lightBlue == 3)
    {
      lightBlueMonopoly = true;
      hasMonopoly = true;
      for(int i = 0; i < owns.size(); i++)
      {
        if(owns.get(i).getColor().equals("light blue"))
        {
          if(owns.get(i).getCost() == owns.get(i).getStartingCost())
          {
            owns.get(i).setCost(owns.get(i).getCost() *2);
          }
          
        }
      }
    }
    if(pink == 3)
    {
      pinkMonopoly = true;
      hasMonopoly = true;
      for(int i = 0; i < owns.size(); i++)
      {
        if(owns.get(i).getColor().equals("pink"))
        {
          if(owns.get(i).getCost() == owns.get(i).getStartingCost())
          {
            owns.get(i).setCost(owns.get(i).getCost() *2);
          }
        }
      }
    }
    if(oarnge == 3)
    {
      oarngeMonopoly = true;
      hasMonopoly = true;
      for(int i = 0; i < owns.size(); i++)
      {
        if(owns.get(i).getColor().equals("oarnge"))
        {
          if(owns.get(i).getCost() == owns.get(i).getStartingCost())
          {
            owns.get(i).setCost(owns.get(i).getCost() *2);
          }
        }
      }
    }
    if(red == 3)
    {
      redMonopoly = true;
      hasMonopoly = true;
      for(int i = 0; i < owns.size(); i++)
      {
        if(owns.get(i).getColor().equals("red"))
        {
          if(owns.get(i).getCost() == owns.get(i).getStartingCost())
          {
            owns.get(i).setCost(owns.get(i).getCost() *2);
          }
        }
      }
    }
    if(yellow == 3)
    {
      yellowMonopoly = true;
      hasMonopoly = true;
      for(int i = 0; i < owns.size(); i++)
      {
        if(owns.get(i).getColor().equals("yellow"))
        {
          if(owns.get(i).getCost() == owns.get(i).getStartingCost())
          {
            owns.get(i).setCost(owns.get(i).getCost() *2);
          }
        }
      }
    }
    if(green == 3)
    {
      greenMonopoly = true;
      hasMonopoly = true;
      for(int i = 0; i < owns.size(); i++)
      {
        if(owns.get(i).getColor().equals("green"))
        {
          if(owns.get(i).getCost() == owns.get(i).getStartingCost())
          {
            owns.get(i).setCost(owns.get(i).getCost() *2);
          }
        }
      }
    }
    if( blue == 2)
    {
      blueMonopoly = true;
      hasMonopoly = true;
      for(int i = 0; i < owns.size(); i++)
      {
        if(owns.get(i).getColor().equals("blue"))
        {
          if(owns.get(i).getCost() == owns.get(i).getStartingCost())
          {
            owns.get(i).setCost(owns.get(i).getCost() *2);
          }
        }
      }
    }
  }

  
  

  public void update()
  { 
    fill(rval,gval,bval);
    if(onSpace == 10 && !jail) // must appear around boarder of space for just visiting
    {
      if(name.equals("Red"))
      {
        ellipse(11,608,radius,radius);
      }
      if(name.equals("Green"))
      {
        ellipse(11,635,radius,radius);
      }
      if(name.equals("Blue"))
      {
        ellipse(37,665,radius,radius);
      }
      if(name.equals("Black"))
      {
        ellipse(62,665,radius,radius);
      }
    }
    else
    {
      ellipse(pieceX,pieceY,radius,radius);
    }
    
  }
  
  public int onSpace()
  {
    return onSpace;
  }
  public void setOnSpace(int i)
  {
    onSpace = i;
  }
  public boolean getStartBuy()
  {
    return startBuy;
  }
  public void setStartBuy(boolean b)
  {
    startBuy = b;
  }
  public int getMoney()
  {
    return money;
  }
  public void setMoney(int i)
  {
    money = i;
  }
  public void setJail(boolean b)
  {
    jail = b;
  }
  public ArrayList<space> getOwns()
  {
    return owns;
  }
  public boolean getPayUp()
  {
    return payUp;
  }
  public void setMoneyTrade(int i)
  {
    moneyTrade = i;
  }
  public void setPayUp(boolean b)
  {
    payUp = b;
  }
  public void setFreeCard(boolean b)
  {
    freeCard = b;
  }
  public void setDoublesCounter(int i)
  {
    doublesCounter = i;
  }
  public void setOfferedPlayer(String s)
  {
    offeredPlayer = s;
  }
  public void setTradeSubmit(boolean b)
  {
    tradeSubmit = b;
  }
  public int getRed()
  {
    return rval;
  }
  public int getGreen()
  {
    return gval;
  }
  public int getBlue()
  {
    return bval;
  }
}

public void jump(int c, int d)
{
  for(int i = 0; i < abs(d); i++)
  {
    if(d > 0)
    {
      c+=1;
      delay(10);
    }
    if(d<0)
    {
      c -=1;
      delay(10);
    }
  }
  delay(150);
}
