public class dice
{
  public int dicenum;

  
  public dice()
  {}
  
  public int rolldice()
  {
    dicenum = (int)(1 + 6*Math.random());
    return dicenum;
  }
}
