public class utilspace extends propspace
{
  public utilspace()
  {}
  
  public utilspace(int isx, int isy, int isw, int ish, String isname)
  {
    super(isx,isy,isw,ish,isname);
    Color = "rambow";
    price = 150;
  }
  
  public int getCost()
  {
    if(doubleCost)
    {
      if(p1.utilityMonopoly || p2.utilityMonopoly || p3.utilityMonopoly || p4.utilityMonopoly)
      {
        return 20*(diceNum + dice2Num);
      }
      return 8*(diceNum + dice2Num);
    }
    
    if(p1.utilityMonopoly || p2.utilityMonopoly || p3.utilityMonopoly || p4.utilityMonopoly)
    {
      return 10*(diceNum + dice2Num);
    }
    return 4*(diceNum + dice2Num);
  }
}
