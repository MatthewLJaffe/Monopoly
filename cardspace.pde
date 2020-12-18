public class cardspace extends space 
{
  protected String type = "";
  
  public cardspace(int isx, int isy, int isw, int ish,String isType)
  {
    super(isx,isy,isw,ish);
    type = isType;  
  }
  
  
  public String getType()
  {
    return type;
  }
  
  
}


//create 2 string arrays
//when cardspace is landed on check type and get random string from corresponding array 
//have play card function that takes cards instruction and does corresponding action
//have this play card function activate show card function in main that displays correct card face up for the duration of the turn
