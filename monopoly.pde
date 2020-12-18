// incidents (could be resolved) 
// got out of jail after one roll possibly time in jail not getting refreshed properly
//passing go multiple times for 200$ possibly

//to do
//organization
  //group all buttons togeather and have process be the same

int m = 1;
int n = 10;
ArrayList<piece> playing = new ArrayList<piece>(0);
ArrayList<space> allSpaces = new ArrayList<space>(0);
dice d1 = new dice();
dice d2 = new dice();
int diceNum = 0;
int dice2Num = 0;
boolean startRoll = false;
piece p1;
piece p2;
piece p3;
piece p4;
int turn = 0;
boolean NotRolled = true;
boolean endTurn = false;
boolean bought = false;
boolean onBuyButton = false;
boolean willHouse = false;
boolean startHouse = false;
PImage go;
PImage communityChest;
PImage communityChest90;
PImage communityChest270;
PImage utility1;
PImage utility2;
PImage railRoad;
PImage railRoad90;
PImage railRoad180;
PImage railRoad270;
PImage jail;
PImage chance;
PImage chance180;
PImage chance270;
PImage luxuryTax;
PImage freeParking;
PImage goToJail;
boolean testM = false;
String chestCard = "";
String chanceCard = "";
String[] chanceDeck = new String[17];
String[] ccDeck = new String[17];
boolean startDraw = false;
boolean doubleCost = false;
int advanceSpace = 0;
boolean twoP = false;
boolean threeP = false;
boolean payMessage = false;
String recievingPlayer; //for displaying who gets payed when property is landed on 
String reaction;
boolean willMortgage = false;
boolean startMortgage = false;
boolean startTrade = false;
boolean playerSelected = false; //checks if second player for tradehas been chosen
boolean dontAdd = false; //keeps the same property from adding multiple times w/ trading
boolean tradeDecide = false;
// main vars
String monopolyVars = ""+ m + "\n" + n + "\n" + diceNum + "\n" + dice2Num + "\n"+ startRoll + "\n" + turn + "\n" +
NotRolled + "\n" + endTurn + "\n" + bought + "\n" + onBuyButton + "\n" + willHouse + "\n" + startHouse +"\n" + testM 
+ "\n" + chestCard + "\n" + chanceCard + "\n" + startDraw + "\n" + doubleCost + "\n" + advanceSpace + "\n" 
+ twoP + "\n" + threeP + "\n" + payMessage + "\n" + recievingPlayer + "\n" + reaction + "\n" + willMortgage 
+ "\n" + startMortgage + "\n" + startTrade + "\n" + playerSelected + "\n" + dontAdd + "\n" + tradeDecide;
//for(int i = 0; i < playing.size() + 

void setup()
{
  size( 680,680);
  background(207,255,224);
  p1 = new piece(646,646,15,255,0,0,"Red",1500);
  p2 = new piece(626,626,15,0,255,0,"Green",1500);
  p3 = new piece(646,626,15,0,0,255,"Blue",1500);
  p4 = new piece(626,646,15,0,0,0,"Black",1500);
  playing.add(p1);
  playing.add(p2);
  playing.add(p3);
  playing.add(p4);
  
  go = loadImage("GoMonopoly.gif");
  communityChest = loadImage("CC.png");
  communityChest90 = loadImage("CC90.png");
  communityChest270 = loadImage("CC270.png");
  railRoad = loadImage("railroad.png");
  railRoad90 = loadImage("railroad90.png");
  railRoad270 = loadImage("railroad270.png");
  chance = loadImage("chance.png");
  chance270 = loadImage("chance270.png");
  jail = loadImage("inJailSpace.png");
  luxuryTax = loadImage("luxuryTax.png");
  freeParking = loadImage("freeParking.png");
  goToJail = loadImage("goToJail.png");
  utility1 = loadImage("utility1.png");
  utility2 = loadImage("utility2.png");
  rectMode(CORNER);
  
  for ( int i = 0; i < 40; i++)
  {
    allSpaces.add(new space());
  }
  fill(207,255,224);
  allSpaces.set(0, new space(592,592,88,88,"go"));
  allSpaces.set(1,new propspace(592-56*1,592,56,88,60,2,"purple","mediterranean"));
  allSpaces.set(2,new cardspace(592-56*2,592,56,88,"community chest"));
  allSpaces.set(3,new propspace(592-56*3,592,56,88,60,4,"purple","baltic"));
  allSpaces.set(4,new space(592-56*4,592,56,88,"income tax"));
  allSpaces.set(5,new propspace(592-56*5,592,56,88,"reading"));
  allSpaces.set(6,new propspace(592-56*6,592,56,88,100,6,"light blue","oriental"));
  allSpaces.set(7,new cardspace(592-56*7,592,56,88,"chance"));
  allSpaces.set(8,new propspace(592-56*8,592,56,88,100,6,"light blue","vermont"));
  allSpaces.set(9,new propspace(592-56*9,592,56,88,120,8,"light blue","connecticut"));
  allSpaces.set(10, new space(0,592,88,88,"jail"));
  allSpaces.set(11,new propspace(0,592-56*1,88,56,140,10,"pink","st charles"));
  allSpaces.set(12,new utilspace(0,592-56*2,88,56,"electric company"));
  allSpaces.set(13,new propspace(0,592-56*3,88,56,140,10,"pink","states"));
  allSpaces.set(14,new propspace(0,592-56*4,88,56,160,12,"pink","virginia"));
  allSpaces.set(15,new propspace(0,592-56*5,88,56,"pennsylvania"));
  allSpaces.set(16,new propspace(0,592-56*6,88,56,180,14,"oarnge","st james"));
  allSpaces.set(17,new cardspace(0,592-56*7,88,56,"community chest"));
  allSpaces.set(18,new propspace(0,592-56*8,88,56,180,14,"oarnge","tennessee"));
  allSpaces.set(19,new propspace(0,592-56*9,88,56,200,16,"oarnge","new york"));
  allSpaces.set(20, new space(0,0,88,88,"free parking"));
  allSpaces.set(21, new propspace(32+56*1,0,56,88,220,18,"red","kentucky"));
  allSpaces.set(22, new cardspace(32+56*2,0,56,88,"chance"));
  allSpaces.set(23, new propspace(32+56*3,0,56,88,220,18,"red","indiana"));
  allSpaces.set(24, new propspace(32+56*4,0,56,88,240,20,"red","illinois"));
  allSpaces.set(25, new propspace(32+56*5,0,56,88,"bo"));
  allSpaces.set(26, new propspace(32+56*6,0,56,88,260,22,"yellow","atlantic"));
  allSpaces.set(27, new propspace(32+56*7,0,56,88,260,22,"yellow","ventnor"));
  allSpaces.set(28, new utilspace(32+56*8,0,56,88,"water works"));
  allSpaces.set(29, new propspace(32+56*9,0,56,88,280,24,"yellow","marvin"));
  allSpaces.set(30, new space(592,0,88,88,"go to jail"));
  allSpaces.set(31, new propspace(592,32+56*1,88,56,300,26,"green","pacific"));
  allSpaces.set(32, new propspace(592,32+56*2,88,56,300,26,"green","north carolina"));
  allSpaces.set(33, new cardspace(592,32+56*3,88,56,"community chest"));
  allSpaces.set(34, new propspace(592,32+56*4,88,56,300,28,"green","pennsylvania ave"));
  allSpaces.set(35, new propspace(592,32+56*5,88,56,"short line"));
  allSpaces.set(36, new cardspace(592,32+56*6,88,56,"chance"));
  allSpaces.set(37, new propspace(592,32+56*7,88,56,350,35,"blue","park place"));
  allSpaces.set(38, new space(592,32+56*8,88,56,"luxury tax"));
  allSpaces.set(39, new propspace(592,32+56*9,88,56,400,50,"blue","boardwalk"));
  ccDeck[0] = "go"; //done
  ccDeck[1] = "200"; //done
  ccDeck[2] = "-50"; //done
  ccDeck[3] = "45"; //done
  ccDeck[4] = "jailFree"; //done
  ccDeck[5] = "jail"; //done
  ccDeck[6] = "every50"; //done
  ccDeck[7] = "100"; //done
  ccDeck[8] = "10"; //done
  ccDeck[9] = "100"; //done
  ccDeck[10] = "-50"; //done
  ccDeck[11] = "-50"; //done
  ccDeck[12] = "25"; //done
  ccDeck[13] = "repairs";
  ccDeck[14] = "10"; //done 
  ccDeck[15] = "100"; //done
  ccDeck[16] = "20"; //done
  
  chanceDeck[0] = "go"; //done
  chanceDeck[1] = "location11"; //done
  chanceDeck[2] = "location24"; //done
  chanceDeck[3] = "locationUtility"; //done
  chanceDeck[4] = "locationRailroad"; //done
  chanceDeck[5] = "50"; //done
  chanceDeck[6] = "jailFree"; //done
  chanceDeck[7] = "back3";//done
  chanceDeck[8] = "jail"; //done
  chanceDeck[9] = "repairs"; //25 for house 100 for hotel
  chanceDeck[10] = "-15"; //done
  chanceDeck[11] = "location5"; //done
  chanceDeck[12] = "location39"; //done
  chanceDeck[13] = "chairman"; // done
  chanceDeck[14] = "150"; //done
  chanceDeck[15] = "100"; //done
  chanceDeck[16] = "-50"; //done
  
  for ( int i = 0; i < 40; i++)
  {
    if(allSpaces.get(i).getClass() == propspace.class)
    {
      allSpaces.get(i).setStartingCost(allSpaces.get(i).getCost());
    }
  }
  
}

void draw()
{

  if(playing.get(turn).money <= 0)
  {
    for(int i = 0; i < playing.get(turn).owns.size(); i++)
    {
      println(playing.get(turn).owns.get(i).name);
      playing.get(turn).owns.get(i).setOwn(false);
      playing.get(turn).owns.get(i).setHouses(0);
      playing.get(turn).owns.get(i).setCost(playing.get(turn).owns.get(i).getStartingCost());
      playing.get(turn).owns.get(i).setMortgaged(false);
    }
    for(int i = 0; i <playing.get(turn).owns.size(); i++)
    {
      playing.get(turn).owns.remove(0);
    }
    playing.remove(turn);
    NotRolled = true;
    if(turn == playing.size())
    {
      turn = 0;
    }
    
  }
  fill(207,255,224);
  rectMode(CORNER);
  rect(88,88,504,504);
  
  
  // chance / community chest decks
  fill(229,205,22);
  rect(120,440,120,70);
  fill(241,93,17);
  rect(425,175,120,70);
  
  textSize(14);
  fill(0);
;
  
  
  
  
  for( int i = 0; i < allSpaces.size(); i++)
  {
    allSpaces.get(i).update();
    if(allSpaces.get(i).getOwned() == true)
    {
      if(allSpaces.get(i).getOwnColor().equals("Red"))
      {
        fill(255,0,0);
      }
      if(allSpaces.get(i).getOwnColor().equals("Green"))
      {
        fill(0,255,0);
      }
      if(allSpaces.get(i).getOwnColor().equals("Blue"))
      {
        fill(0,0,255);
      }
      if(allSpaces.get(i).getOwnColor().equals("Black"))
      {
        fill(0);
      }
      if(allSpaces.get(i).getMortgaged())
      {
        fill(125);
      }
      if(i < 10)
      {
        triangle(allSpaces.get(i).getX()+28,allSpaces.get(i).getY()-5,
        allSpaces.get(i).getX()+20,allSpaces.get(i).getY()-12,
        allSpaces.get(i).getX()+36,allSpaces.get(i).getY()-12);
      }
      else if( i >= 10 && i < 20)
      {
        triangle(allSpaces.get(i).getX()+93,allSpaces.get(i).getY()+28,
        allSpaces.get(i).getX()+100,allSpaces.get(i).getY()+20,
        allSpaces.get(i).getX()+100,allSpaces.get(i).getY()+36);
      }
      else if( i >= 20 && i < 30)
      {
        triangle(allSpaces.get(i).getX()+28,allSpaces.get(i).getY()+93,
        allSpaces.get(i).getX()+20,allSpaces.get(i).getY()+100,
        allSpaces.get(i).getX()+36,allSpaces.get(i).getY()+100);
      }
      else
      {
        triangle(allSpaces.get(i).getX()-5,allSpaces.get(i).getY()+28,
        allSpaces.get(i).getX()-12,allSpaces.get(i).getY()+20,
        allSpaces.get(i).getX()-12,allSpaces.get(i).getY()+36);
      }
    }
  }
  
  
  image(go,592,592);
  fill(255);
  rectMode(CENTER);
  if(mousePressed && startRoll)
  {
    fill(200);
  }
  rect(260,340,80,40);
  textSize(18);
  fill(0,102,153);
  text("Roll Dice",222,348);
  fill(255);
  if(mousePressed && endTurn)
  {
    fill(200);
  }
  rect(420,340,80,40);
  fill(0,102,153);
  text("End Turn",381,348);
  
  //purple
  fill(29,0,89);
  rectMode(CORNER);
  rect(592-56,592,56,20);
  image(communityChest,593-56*2,600);
  rect(592-56*3,592,56,20);
  fill(0);
  textSize(13);
  text("INCOME" +"\n"+ "   TAX",595-56*4,625);
  image(railRoad,592-56*5,610);
  
  //light blue
  fill(163,206,235);
  rect(592-56*6,592,56,20);
  image(chance,592-58*7,592);
  rect(592-56*8,592,56,20);
  rect(592-56*9,592,56,20);
  image(jail,585-56*10,591);
  
  //oarnge
  fill(242,141,54);
  rect(68,592-56*6,20,56);
  image(communityChest90,-15,592-56*7);
  rect(68,592-56*8,20,56);
  rect(68,592-56*9,20,56);
  
  //pink
  fill(139,15,81);
  rect(68,592-56,20,56);
  image(utility1,19,592-52*2);
  rect(68,592-56*3,20,56);
  rect(68,592-56*4,20,56);
  image(railRoad90,20,592-56*5);
  
  //red
  fill(205,0,43);
  image(freeParking,10,0);
  rect(32+56,0,56,20);
  image(chance,32+49*2,0);
  rect(32+56*3,0,56,20);
  rect(32+56*4,0,56,20);
  image(railRoad,592-56*5,15);
  
  
  //yellow 
  fill(242,212,42);
  rect(32+56*6,0,56,20);
  rect(32+56*7,0,56,20);
  image(utility2,32+56*8,25);
  rect(32+56*9,0,56,20);
  image(goToJail,32+57*10,5);
 
  
  //green
  fill(0,200,100);
  rect(68+524,592-56*6,20,56);
  image(communityChest270,605,592-56*7);
  rect(68+524,592-56*8,20,56);
  rect(68+524,592-56*9,20,56);
  image(railRoad270,68+542,592-56*5);
  image(chance270,68+525,592-60*4);
  
  //blue 0,53,136
  fill(0,53,136);
  rect(68+524,592-56*1,20,56);
  image(luxuryTax,68+514,592-119);
  rect(68+524,592-56*3,20,56);
  
    
  for( int i = 0; i < allSpaces.size(); i++)
  {
    if(allSpaces.get(i).getHouses() > 0)
    {
      if(allSpaces.get(i).getHouses() >= 1 && allSpaces.get(i).getHouses() != 5)
      {
        fill(0,100,0);
        if(i < 10 ||( i < 30 && i >= 20))
        {
          rect(allSpaces.get(i).x + 2, allSpaces.get(i).y + 4.25, 11.5,11.5);
        }
        if(i >= 10 && i < 20)
        {
          rect(allSpaces.get(i).x +72.25, allSpaces.get(i).y+2, 11.5, 11.5);
        }
        if(i >= 30 && i < 40)
        {
          rect(allSpaces.get(i).x +4.25, allSpaces.get(i).y+2, 11.5, 11.5);
        }
      }
      if(allSpaces.get(i).getHouses() >= 2 && allSpaces.get(i).getHouses() != 5)
      {
        fill(0,100,0);
        if(i < 10 ||( i < 30 && i >= 20))
        {
          rect(allSpaces.get(i).x + 15.5, allSpaces.get(i).y + 4.25, 11.5,11.5);
        }
        if(i >= 10 && i < 20)
        {
          rect(allSpaces.get(i).x +72.25, allSpaces.get(i).y+15.5, 11.5, 11.5);
        }
        if(i >= 30 && i < 40)
        {
          rect(allSpaces.get(i).x +4.25, allSpaces.get(i).y+15.5, 11.5, 11.5);
        }
      }
      if(allSpaces.get(i).getHouses() >= 3 && allSpaces.get(i).getHouses() != 5)
      {
        fill(0,100,0);
        if(i < 10 ||( i < 30 && i >= 20))
        {
          rect(allSpaces.get(i).x + 29, allSpaces.get(i).y + 4.25, 11.5,11.5);
        }
        if(i >= 10 && i < 20)
        {
          rect(allSpaces.get(i).x +72.25, allSpaces.get(i).y+29, 11.5, 11.5);
        }
        if(i >= 30 && i < 40)
        {
          rect(allSpaces.get(i).x +4.25, allSpaces.get(i).y + 29, 11.5, 11.5);
        }
      }
      if(allSpaces.get(i).getHouses() == 4)
      {
        fill(0,100,0);
        if(i < 10 ||( i < 30 && i >= 20))
        {
          rect(allSpaces.get(i).x + 42.5, allSpaces.get(i).y + 4.25, 11.5,11.5);
        }
        if(i >= 10 && i < 20)
        {
          rect(allSpaces.get(i).x +72.25, allSpaces.get(i).y + 42.5, 11.5, 11.5);
        }
        if(i >= 30 && i < 40)
        {
          rect(allSpaces.get(i).x +4.25, allSpaces.get(i).y+ 42.5, 11.5, 11.5);
        }
      }
      if(allSpaces.get(i).getHouses() == 5)
      {
        fill(255,0,0);
        if(i < 10 ||( i < 30 && i >= 20))
        {
          rect(allSpaces.get(i).x + 17, allSpaces.get(i).y + 4, 22,12);
        }
        if(i >= 10 && i < 20)
        {
          rect(allSpaces.get(i).x +72.25, allSpaces.get(i).y+17, 12, 22);
        }
        if(i >= 30 && i < 40)
        {
          rect(allSpaces.get(i).x +4.25, allSpaces.get(i).y+17, 12, 22);
        }
      }
    }
  }
  
  
  rectMode(CENTER);

  
  if(320 < mouseY && mouseY < 360 && 220 < mouseX && mouseX < 300)
  {
       startRoll = true;
  }
  else
  {
    startRoll = false;
  }
  
  
  if(320 < mouseY && mouseY < 360 && 380 < mouseX && mouseX < 460)
  {
       endTurn = true;
  }
  else
  {
    endTurn = false;
  }
  
  fill(255,255,255);
  rect(150,210,50,50);
  rect(210,210,50,50);
  if (diceNum != 0)
  {
    if (diceNum == 1)
    {
      fill(0);
      ellipse(150,210,10,10);
    }
    if (diceNum == 2)
    {
      fill(0);
      ellipse(140,200,10,10);
      ellipse(160,220,10,10);
    }
    if (diceNum == 3)
    {
      fill(0);
      ellipse(137,197,10,10);
      ellipse(150,210,10,10);
      ellipse(163,223,10,10);
    }
    if (diceNum == 4)
    {
      fill(0);
      ellipse(137,197,10,10);
      ellipse(163,197,10,10);
      ellipse(163,223,10,10);
      ellipse(137,223,10,10);
    }
    if (diceNum == 5)
    {
      fill(0);
      ellipse(137,197,10,10);
      ellipse(163,197,10,10);
      ellipse(150,210,10,10);
      ellipse(163,223,10,10);
      ellipse(137,223,10,10);
    }
    if (diceNum == 6)
    {
      fill(0);
      ellipse(137,197,10,10);
      ellipse(163,197,10,10);
      ellipse(137,210,10,10);
      ellipse(163,210,10,10);
      ellipse(163,223,10,10);
      ellipse(137,223,10,10);
    }
  }
  
  if (dice2Num != 0)
  {
    if (dice2Num == 1)
    {
      fill(0);
      ellipse(150+60,210,10,10);
    }
    if (dice2Num == 2)
    {
      fill(0);
      ellipse(140+60,200,10,10);
      ellipse(160+60,220,10,10);
    }
    if (dice2Num == 3)
    {
      fill(0);
      ellipse(137+60,197,10,10);
      ellipse(150+60,210,10,10);
      ellipse(163+60,223,10,10);
    }
    if (dice2Num == 4)
    {
      fill(0);
      ellipse(137+60,197,10,10);
      ellipse(163+60,197,10,10);
      ellipse(163+60,223,10,10);
      ellipse(137+60,223,10,10);
    }
    if (dice2Num == 5)
    {
      fill(0);
      ellipse(137+60,197,10,10);
      ellipse(163+60,197,10,10);
      ellipse(150+60,210,10,10);
      ellipse(163+60,223,10,10);
      ellipse(137+60,223,10,10);
    }
    if (dice2Num == 6)
    {
      fill(0);
      ellipse(137+60,197,10,10);
      ellipse(163+60,197,10,10);
      ellipse(137+60,210,10,10);
      ellipse(163+60,210,10,10);
      ellipse(163+60,223,10,10);
      ellipse(137+60,223,10,10);
    }
  }
  for(int i = 0; i < playing.size(); i++)
  {
    playing.get(i).update();
  }
  //makes names look like buttons when trade is selected


  textSize(16);
  if(isPlaying(p1))
  {
    if(startTrade && !playerSelected && !playing.get(turn).name.equals("Red"))
    {
      fill(255);
      rect(168,125,150,25);
    }
    fill(255,0,0);
    text("Player one: " + p1.getMoney() + "$",100,130); 
  }
  if(isPlaying(p2))
  {
    if(startTrade && !playerSelected && !playing.get(turn).name.equals("Green"))
    {
      fill(255);
      rect(168+320,125,150,25);
    }
    fill(0,255,0);
    text("Player two: " + p2.getMoney() + "$",420,130);
  }
  if(isPlaying(p3))
  {
    if(startTrade && !playerSelected && !playing.get(turn).name.equals("Blue"))
    {
      fill(255);
      rect(495,555,170,25);
    }
    fill(0,0,255);
    text("Player three: " + p3.getMoney() + "$",420,560);
  }
  if(isPlaying(p4))
  {
    if(startTrade && !playerSelected && !playing.get(turn).name.equals("Black"))
    {
      fill(255);
      rect(175,555,155,25);
    }
    fill(0);
    text("Player four: " + p4.getMoney() + "$",100,560);
  }
  fill(playing.get(turn).rval,playing.get(turn).gval,playing.get(turn).bval);
  text("Turn: " + playing.get(turn).name + " player",270,240);
 
  if(playing.get(turn).doublesCounter == 3)
  {
    playing.get(turn).setJail(true);
    playing.get(turn).moveTo(10);
    playing.get(turn).setDoublesCounter(0);
  }
  if(playing.get(turn).jail && !playing.get(turn).freeCard)
  {
    fill(255); 
    rect(340,340,60,60); 
    fill(0,102,153); 
    textSize(12);
    text("pay for" + "\n" + "freedom",318,335);
  } 
  if(playing.get(turn).jail && playing.get(turn).freeCard)
  {
    fill(255); 
    rect(340,340,60,60); 
    fill(0,102,153); 
    textSize(12);
    text("Get out " + "\n" + "of jail"+ "\n" + " free",322,328);
  }
  if(playing.get(turn).getStartBuy() && !bought && !playing.get(turn).jail)
  {
    textSize(14);
    fill(255); 
    rect(340,340,60,60); 
    fill(0,102,153); 
    text("Buy for " + "\n" + "  "+ allSpaces.get(playing.get(turn).onSpace).getPrice()+ "$",315,335);
  }
  
  fill(255);
  if(mouseX > 310 && mouseX < 370 && mouseY > 380 && mouseY < 430 && mousePressed  && !playerSelected && !tradeDecide)
  {
    //fill(200);
    startTrade = true;

  }
  if(mouseX > 310 && mouseX < 370 && mouseY > 380 && mouseY < 430 && mousePressed  && playerSelected)
  {
    //fill(200);
    playing.get(turn).tradeSubmit = true;
  }
  if(mouseX > 310 && mouseX < 370 && mouseY > 380 && mouseY < 430 && mousePressed  && tradeDecide)
  {
    //fill(200);
    for(int i = 0; i <playing.size(); i++)
    {
      if(playing.get(i).offeredPlayer.equals(playing.get(turn).name)) //get the player that wanted to trade at index i
      {
        //money swap
        println("trader money put up "+playing.get(i).moneyTrade);
        println("acceptor money put up "+playing.get(turn).moneyTrade);
        playing.get(i).setMoney( playing.get(i).money -  playing.get(i).moneyTrade);
        playing.get(i).setMoney( playing.get(i).money +  playing.get(turn).moneyTrade);
        
        playing.get(turn).setMoney( playing.get(turn).money -  playing.get(turn).moneyTrade);
        playing.get(turn).setMoney( playing.get(turn).money +  playing.get(i).moneyTrade);
        
        playing.get(i).setMoneyTrade(0);
        playing.get(turn).setMoneyTrade(0);
        
        //property swap
        for(int j = 0; j < playing.get(i).propTrade.size(); j++)
        {
          playing.get(i).propTrade.get(j).setOwnColor(playing.get(turn).name);
          playing.get(turn).owns.add(playing.get(i).propTrade.get(j));
          //fix
          for(int l = 0; l < playing.get(i).owns.size(); l++)
          {
            if(playing.get(i).owns.get(l).name.equals( playing.get(i).propTrade.get(j).name))
            {
              playing.get(i).owns.remove(l);
            }
          }
          playing.get(i).propTrade.remove(j);
        }
        for(int k = 0; k < playing.get(turn).propTrade.size(); k++)
        {
          playing.get(turn).propTrade.get(k).setOwnColor(playing.get(i).name);
          playing.get(i).owns.add(playing.get(turn).propTrade.get(k));
          for(int l = 0; l < playing.get(turn).owns.size(); l++)
          {
            //fix
            if(playing.get(turn).owns.get(l).name.equals( playing.get(turn).propTrade.get(k).name))
            {
              playing.get(turn).owns.remove(l);
            }
          }
          playing.get(turn).propTrade.remove(k);
        }
        
        playing.get(i).setOfferedPlayer("");
        playing.get(i).tradeSubmit = false; //must belong to piece at index i
      }
      
    }
    tradeDecide = false;
    delay(400);
  }
  

  if(mouseX>310 && mouseX < 370 && mouseY >250 && mouseY < 300 && mousePressed)
  {
    delay(200);
    if(startTrade)
    {
      clearTrade(playing.get(turn));
    }
    if(playerSelected)
    {
      for(int i = 0; i < playing.size(); i++)
      {
        if(playing.get(i).name.equals(playing.get(turn).offeredPlayer))
        {
          println("clear going through");
          clearTrade(playing.get(i));
        }
      }
      if(playing.get(turn).offeredPlayer.equals("Red"))
      {
        println("red clear");
        clearTrade(p1);
      }
      if(playing.get(turn).offeredPlayer.equals("Green"))
      {
        println("green clear");
        clearTrade(p2);
      }
      if(playing.get(turn).offeredPlayer.equals("Blue"))
      {
        println("blue clear");
        clearTrade(p3);
      }
      if(playing.get(turn).offeredPlayer.equals("Black"))
      {
        println("black clear");
        clearTrade(p4);
      }
      
    }
    if(tradeDecide)
    {
      for(int i =0; i < playing.size(); i++)
      {
        if(playing.get(i).offeredPlayer.equals(playing.get(turn).name))
        {
          clearTrade(playing.get(i));
        }
      }
    }
    
  }
  textSize(13);
  if(startTrade)
  {
    
    rect(340,275,60,50);
    fill(0,102,153);
    text(" Clear \n Trade",318,270);
  }
  if(tradeDecide)
  {
    
    rect(340,275,60,50);
    fill(0,102,153);
    text(" Reject \n Trade",318,270);
  }
 
  //box for trade
  fill(255);
  rect(340,405,60,50);
  fill(0,102,153);



  for(int i = 0; i <playing.size(); i++)
  {
    if(playing.get(i).tradeSubmit)
    {
      if(playing.get(i).offeredPlayer.equals(playing.get(turn).name))
      {
        text(" accept \n  Trade",315,400);
        tradeDecide = true;
      }
    }
  }
    
  if(!startTrade && !tradeDecide)
  {
    text("Propose \n Trade",315,400);
  }
  if(startTrade && !playerSelected)
  {
    text("  Select \n  Player",315,400);
  }
  if(startTrade && playerSelected)
  {
    text(" Submit \n  Trade",315,400);
  }


  
  // model example of how to button
  if(playing.get(turn).owns.size() > 0)
  {
    fill(255);
    if(mouseX > 380 && mouseX < 450 && mouseY > 373 && mouseY < 417)
    {
      willMortgage = true;
      if(mousePressed)
      {
        fill(200);
      }
    }
    else
    {
      willMortgage = false;
    }
    rect(415,395,70,45);
    fill(120,0,0);
    textSize(13.5);
    text("Mortgage \n  Space",385,390);
  }
  else
  {
    willMortgage = false;
  }
  
  if(playing.get(turn).hasMonopoly)
  {
    fill(255);
    if(mouseX > 230 && mouseX < 300 && mouseY > 373 && mouseY < 417)
    {
      willHouse = true;
      if(mousePressed)
      {
        fill(200);
      }
    }
    else
    {
      willHouse = false;
    }
    rect(265,395,70,45);
    fill(0,102,153);
    textSize(13.5);
    text("Purchase" + "\n" + "  House",236,390);
  }
  else
  {
    willHouse = false;
  }
  
  for(int i = 0; i < playing.size(); i++)
  if(playing.get(i).getPayUp())
  {
    pay(playing.get(i));
    payMessage = true;
  }
  //recieving player and reaction definded in pay method

  if(payMessage)
  {
    fill(0);
    textSize(12);
    text(playing.get(turn).name + " player" + " just payed " +"\n" +
    allSpaces.get(playing.get(turn).onSpace).getCost() + "$"+
    " to " + recievingPlayer + reaction,260,150);
  }
  
  
  if(startHouse)
  {
    buyHouse(playing.get(turn));
  }
  if(startMortgage)
  {
    mortgageProperty(playing.get(turn));
  }
 
  if(playing.get(turn).chanceDraw && startDraw)
  {
    chanceCard = chanceDeck[(int)random(1,17)];
    startDraw = false;
    activateCard(chanceCard, playing.get(turn));
  }
  if(playing.get(turn).communityChestDraw && startDraw)
  {
    chestCard = ccDeck[(int)random(1,17)];
    startDraw = false;
    activateCard(chestCard, playing.get(turn));
  }
  fill(0);
  if(chestCard.equals("go"))
  {
    fill(0);
    textSize(14);
    text("Advance to go" + "\n" + "collect 200$",135,465);
  }
  if(chestCard.equals("200"))
  {
    textSize(13);
    text("Bank error" + "\n" + "in your favor" + "\n" + "collect 200$",135,460);
  }
  if(chestCard.equals("-50"))
  {
    textSize(14);
    text("Doctor's fee" + "\n" + "pay 50$",135,470);
  }
  if(chestCard.equals("45"))
  {
    textSize(12);
    text("From sale of stock" + "\n" + "you get 45$",128,470);
  }
  if(chestCard.equals("jailFree"))
  {
    text("Get out of" + "\n" + "jail free",135,470);
  }
  if(chestCard.equals("jail"))
  {
    text("" + "\n" + "to jail",135,470);
  }
  if(chestCard.equals("every50"))
  {
    textSize(12);
    text("Opera opening" + "\n" + "collect 50$" + "\n" + "from every player",135,460);
  }
  if(chestCard.equals("10"))
  {
    textSize(12);
    text("You won 2nd" + "\n" + "in a beauty contest" + "\n" + "colect 10$",125,460);
  }
  if(chestCard.equals("100"))
  {
    textSize(12);
    text("Christmas fund" + "\n" + "matures" + "\n" + "collect 100$",125,460);
  }
  if(chestCard.equals("25"))
  {
    textSize(12);
    text("Recieve" + "\n" + "for services" + "\n" + "25$",125,460);
  }
  if(chestCard.equals("repairs"))
  {
    textSize(10);
    text("You are assessed" + "\n" + "for street repairs" + "\n" + "40$ per house" + "\n" + "115$ per hotel" ,140,455);
  }
  if(chestCard.equals("20"))
  {
    textSize(12);
    text("Income tax" + "\n" + "refund" + "\n" + "collect 20$",145,460);
  }
  
  if(chanceCard.equals("go"))
  {
    textSize(14);
    text("Advance to go" + "\n" + "collect 200$",438, 205);
  }
  if(chanceCard.equals("location11"))
  {
    textSize(12);
    text("Advance to" + "\n" + "St. Charles Place",438, 205);
  }
  if(chanceCard.equals("location24"))
  {
    textSize(12);
    text("Advance to" + "\n" + "Illinois Ave.",450, 205);
  }
  if(chanceCard.equals("locationUtility"))
  {
    textSize(10);
    text("Advance to" + "\n" + "nearest utility"+ "\n" + "if owned pay 2X" + "\n" + "ammount owed",450, 190);
  }
  if(chanceCard.equals("locationRailroad"))
  {
    textSize(10);
    text("Advance to" + "\n" + "nearest railroad"+ "\n" + "if owned pay 2X" + "\n" + "ammount owed",450, 190);
  }
  if(chanceCard.equals("50"))
  {
    textSize(12);
    text("Bank pays you" + "\n" + "dividend of 50$",440, 205);
  }
  if(chanceCard.equals("jailFree"))
  {
    textSize(14);
    text("Get out of" + "\n" + "jail free",440, 205);
  }
  if(chanceCard.equals("back3"))
  {
    textSize(14);
    text("Go back" + "\n" + "3 spaces",455, 205);
  }
  if(chanceCard.equals("jail"))
  {
    text("Go directly" + "\n" + "to jail",440, 205);
  }
  if(chanceCard.equals("repairs"))
  {
    textSize(10);
    text("You are assessed" + "\n" + "for street repairs" + "\n" + "25$ per house" + "\n" + "100$ per hotel" ,445,190);
  }
  if(chanceCard.equals("-15"))
  {
    textSize(14);
    text("Pay poor tax" + "\n" + "of 15$",445, 205);
  }
  if(chanceCard.equals("location5"))
  {
    textSize(12);
    text("Take a ride" + "\n" + "on the Reading",445, 205);
  }
  if(chanceCard.equals("location39"))
  {
    textSize(14);
    text("Advance token" + "\n" + "to Boardwalk",445, 205);
  }
  if(chanceCard.equals("chairman"))
  {
    textSize(10);
    text("You are elected" + "\n" + "Chairman of the board" + "\n" + "pay each player" + "\n" + "50$" ,430,190);
  }
  if(chanceCard.equals("150"))
  {
    textSize(12);
    text("Your building" + "\n" + "and loan matures" + "\n" + "collect 150$",430,195);
  }
  if(chanceCard.equals("100"))
  {
    textSize(12);
    text("Christmas fund" + "\n" + "matures" + "\n" + "collect 100$",430,195);
  }
  if(chanceCard.equals("-50"))
  {
    textSize(14);
    text("Doctor's fee" + "\n" + "pay 50$",445, 205);
  }
  
  if(keyPressed && key =='2' && twoP == false)
  {
    playing.remove(playing.size()-1);
    playing.remove(playing.size()-1);
    twoP = true;
  }
  if(keyPressed && key =='3' && threeP == false && twoP == false)
  {
    playing.remove(playing.size()-1);
    threeP = true;
  }
  if(keyPressed && key =='r')
  {
    activateCard("repairs",p1);
    delay(400);
  }
  if(keyPressed && key =='l')
  {
    for(int i = 0; i < playing.size(); i++)
    {
      if(playing.get(i).rval == 255 && playing.get(i).gval == 0  && playing.get(i).bval == 0)
      {
        playing.get(i).setMoney( playing.get(i).money - 500);
        delay(400);
      }
    }
  }
  // all initial trade stuff
  if(startTrade)
  {
    fill(0);
    textSize(10);
    text("Money: "+playing.get(turn).moneyTrade+"$",250,465);
    triangle(330,460,340,460,335,450);
    triangle(330,465,340,465,335,475);
    text("Properties: " + listProps(playing.get(turn).propTrade),250,500);
    text("For",370,482);
    if(mousePressed)
    {
      if(mouseX >330 && mouseX <340 && mouseY > 450 && mouseY < 460)
      {
        playing.get(turn).moneyTrade += 10;
        delay(100);
      }
      if(mouseX >330 && mouseX <340 && mouseY > 465 && mouseY < 475)
      {
        if(playing.get(turn).moneyTrade >= 10)
        {
          playing.get(turn).moneyTrade -= 10;
          delay(100);
        }
      }
      dontAdd = false;
      for(int i = 0; i < playing.get(turn).owns.size(); i++)
      {
        if(mouseX - playing.get(turn).owns.get(i).x >= 0 && mouseX - playing.get(turn).owns.get(i).x < playing.get(turn).owns.get(i).w 
        && mouseY - playing.get(turn).owns.get(i).y >= 0 && mouseY - playing.get(turn).owns.get(i).y < playing.get(turn).owns.get(i).h)
        {
          for(int j = 0; j < playing.get(turn).propTrade.size(); j++)
          {
            if(playing.get(turn).propTrade.get(j).name.equals(playing.get(turn).owns.get(i).name))
            {
              dontAdd = true;
            }
          }
          if(!dontAdd)
          {
            playing.get(turn).propTrade.add(playing.get(turn).owns.get(i));
          }
        }       
      }
      boolean tradeFree = true; 
      if(mouseX > 168-75 && mouseX < 168+75  && mouseY > 125-12 && mouseY < 125 + 12 && !playing.get(turn).name.equals("Red") && isPlaying(p1))
      {
        for(int i = 0; i < playing.size(); i++)
        {
          if(playing.get(i).offeredPlayer.equals("Red") || p1.tradeSubmit)
          {
            tradeFree = false;
          }       
        }
        if(tradeFree)
        {
          playerSelected = true;
          playing.get(turn).setOfferedPlayer("Red");
        }
      }
      tradeFree = true;
      if(mouseX > 168+320-75 && mouseX < 168+320+75  && mouseY > 125-12 && mouseY < 125 + 12 && !playing.get(turn).name.equals("Green") && isPlaying(p2))
      {
        for(int i = 0; i < playing.size(); i++)
        {
          if(playing.get(i).offeredPlayer.equals("Green") || p2.tradeSubmit)
          {
            tradeFree = false;
          }       
        }
        if(tradeFree)
        {
          playerSelected = true;
          playing.get(turn).setOfferedPlayer("Green");
        }
      }
      tradeFree = true;
      if(mouseX > 495 - 170/2 && mouseX < 495 + 170/2 && mouseY > 555-12 && mouseY < 555+12 && !playing.get(turn).name.equals("Blue") && isPlaying(p3))
      {
        for(int i = 0; i < playing.size(); i++)
        {
          if(playing.get(i).offeredPlayer.equals("Blue") || p3.tradeSubmit)
          {
            tradeFree = false;
          }       
        }
        if(tradeFree)
        {
          playerSelected = true;
          playing.get(turn).setOfferedPlayer("Blue");
        }
      }
      tradeFree = true;
      if(mouseX > 175 - 155/2 && mouseX < 175 + 155/2 && mouseY > 555-12 && mouseY < 555+12 && !playing.get(turn).name.equals("Black")  && isPlaying(p4))
      {
        for(int i = 0; i < playing.size(); i++)
        {
          if(playing.get(i).offeredPlayer.equals("Black") || p4.tradeSubmit)
          {
            tradeFree = false;
          }       
        }
        if(tradeFree)
        {
          playerSelected = true;
          playing.get(turn).setOfferedPlayer("Black");
        }
      }
      
    }
    if(playerSelected)
    {
      for(int i = 0; i < playing.size(); i++)
      {
        if(playing.get(i).name.equals(playing.get(turn).offeredPlayer))
        {
          offerTrade(playing.get(i));
        }
      }
    }
  }
  
  if(playing.size() == 1)
  {
    rectMode(CORNER);
    fill(207,255,224);
    rect(0,0,680,680);
    fill(0);
    textSize(50);
    if(playing.get(0).rval == 255)
    {
      text("player 1 wins",185,340);
    }
    if(playing.get(0).gval == 255)
    {
      text("player 2 wins",185,340);
    }
    if(playing.get(0).bval == 255)
    {
      text("player 3 wins",185,340);
    }
    if(playing.get(0).rval == 0 && playing.get(0).gval == 0 && playing.get(0).bval == 0)
    {
      text("player 4 wins",185,340);
    }
  }
}

void mouseReleased()
{
//call on function that involves selecting propety so it must be run in the main
  if(willHouse)
  {
     print("house ");
     startHouse = true;
  }
  if(willMortgage)
  {
    print("mortgage");
    startMortgage = true;
  }
}

public void offerTrade(piece p)
{
  textSize(10);
  triangle(330+190,460,340+190,460,335+190,450);
  triangle(330+190,465,340+190,465,335+190,475);
  text("Money: " + p.moneyTrade+"$",440,465);
  text("Properties: " + listProps(p.propTrade),440,500);
  if(mousePressed)
  {
    if(mouseX >330 +190 && mouseX <340 +190 && mouseY > 450 && mouseY < 460)
    {
      p.moneyTrade += 10;
      delay(100);
    }
    if(mouseX >330 +190 && mouseX <340 +190 && mouseY > 465 && mouseY < 475)
    {
      if(p.moneyTrade >= 10)
      {
        p.moneyTrade -= 10;
        delay(100);
      }
    }
    dontAdd = false;
    for(int i = 0; i < p.owns.size(); i++)
    {
      if(mouseX - p.owns.get(i).x >= 0 && mouseX - p.owns.get(i).x < p.owns.get(i).w 
      && mouseY - p.owns.get(i).y >= 0 && mouseY - p.owns.get(i).y < p.owns.get(i).h)
      {
        for(int j = 0; j < p.propTrade.size(); j++)
        {
          if(p.propTrade.get(j).name.equals(p.owns.get(i).name))
          {
            dontAdd = true;
          }
        }
        if(!dontAdd)
        {
          p.propTrade.add(p.owns.get(i));
        }
      }     
    }
  }
  
}

void mousePressed()
{
  if(startRoll && NotRolled)
  {
    diceNum = d1.rolldice();
    dice2Num = d2.rolldice();
    //resetting turn basis vars b/c of possibility of doubles
    bought = false; 
    playing.get(turn).setStartBuy(false);
    chanceCard = "";
    chestCard = "";
    payMessage = false;
    if(doubleCost == true &&  allSpaces.get(advanceSpace).getClass() != utilspace.class)
    {
      allSpaces.get(advanceSpace).setCost(allSpaces.get(advanceSpace).getCost()/2);
      advanceSpace = 0;
    }
    doubleCost = false;
    
    if(diceNum == dice2Num && !playing.get(turn).jail)
    {
      NotRolled = true;
      playing.get(turn).setDoublesCounter(playing.get(turn).doublesCounter+1);
    }
    else
    {
      NotRolled = false;
    }
    
    if(!playing.get(turn).jail || diceNum == dice2Num)
    {
      playing.get(turn).move();
    }
    playing.get(turn).checkMonopoly();
    playing.get(turn).runturn(); 
  }
  
  onBuyButton = (mouseX >= 300 && mouseX < 380) && (mouseY >= 300 && mouseY < 380);
  if(playing.get(turn).getStartBuy() && onBuyButton && !bought)
    {
      buy(playing.get(turn));
      onBuyButton = false;
    }
    
    if(playing.get(turn).jail && onBuyButton && ! playing.get(turn).freeCard)
    {
      playing.get(turn).setMoney(playing.get(turn).money -50);
      playing.get(turn).setJail(false);
      playing.get(turn).setDoublesCounter(0);
    }
    if(playing.get(turn).jail && onBuyButton && playing.get(turn).freeCard)
    {
      playing.get(turn).setJail(false);
      playing.get(turn).setFreeCard(false);
      playing.get(turn).setDoublesCounter(0);
    }
    
   // make sure you aren't in the middle of a trade
  if(endTurn && NotRolled == false && (!startTrade || playing.get(turn).tradeSubmit))
  {
    //resets variables used each turn
    if(diceNum == dice2Num && playing.get(turn).doublesCounter < 3)
    {
      playing.get(turn).setJail(false);
    }
    playing.get(turn).setDoublesCounter(0);
    nextTurn();
    NotRolled = true;
    bought = false;
    playing.get(turn).setStartBuy(false);
    chanceCard = "";
    chestCard = "";
    payMessage = false;
    startTrade = false;
    playerSelected = false;
    if(doubleCost == true &&  allSpaces.get(advanceSpace).getClass() != utilspace.class)
    {
      allSpaces.get(advanceSpace).setCost(allSpaces.get(advanceSpace).getCost()/2);
      advanceSpace = 0;
    }
    doubleCost = false;
  }
}



public void nextTurn()
{
  if(turn + 1 == playing.size() || playing.size() == 1)
  {
    turn = 0;
  }
  else
  {
    turn++;
  }
  println(turn);
}


public void pay(piece p)
{
    println("p1 "+p1.getMoney());
    println("p2 "+p2.getMoney());
    println("p3 "+p3.getMoney());
    println("p4 "+p4.getMoney());
    if(allSpaces.get(p.onSpace).getOwnColor().equals("Red"))
    {
      recievingPlayer = "Red player ";
      p1.setMoney(p1.getMoney()+allSpaces.get(p.onSpace).getCost());
      println(allSpaces.get(p.onSpace).getCost());
    }
    if(allSpaces.get(p.onSpace).getOwnColor().equals("Green"))
    {
      recievingPlayer = "Green player ";
      p2.setMoney(p2.getMoney()+allSpaces.get(p.onSpace).getCost());
      println(allSpaces.get(p.onSpace).getCost());
    }
    if(allSpaces.get(p.onSpace).getOwnColor().equals("Blue"))
    {
      recievingPlayer = "Blue player ";
      p3.setMoney(p3.getMoney()+allSpaces.get(p.onSpace).getCost());
      println(allSpaces.get(p.onSpace).getCost());
    }
    if(allSpaces.get(p.onSpace).getOwnColor().equals("Black"))
    {
      recievingPlayer = "Black player ";
      p4.setMoney(p4.getMoney()+allSpaces.get(p.onSpace).getCost());
      println(allSpaces.get(p.onSpace).getCost());
    }
    if(allSpaces.get(p.onSpace).getCost() < 15)
    {
      reaction = " ";
    }
    if(allSpaces.get(p.onSpace).getCost() >= 15 && allSpaces.get(p.onSpace).getCost() < 40 )
    {
      reaction = "owch";
      println("something");
    }
    if(allSpaces.get(p.onSpace).getCost() >= 40 && allSpaces.get(p.onSpace).getCost() < 100 )
    {
      reaction = "Oof";
    }
    if(allSpaces.get(p.onSpace).getCost() >= 100 && allSpaces.get(p.onSpace).getCost() < 200 )
    {
      reaction = "YIKES";
    }
    if(allSpaces.get(p.onSpace).getCost() >= 200)
    {
      reaction = "FeelsBadMan";
    }

    p.setPayUp(false);
    println("p1 " + p1.getMoney());
    println("p2 " + p2.getMoney());
    println("p3 " + p3.getMoney());
    println("p4 " + p4.getMoney());
    println();
    println();
}

/*
public void keyPressed()
{
  
  if(!testM)
  {
    
    for(int i = 0; i < 40; i++)
    {
      p1.getOwns().add(allSpaces.get(i));
      println(allSpaces.get(i).name);
    }
    

    
    
    //p1.moveTo(5);
    //buy(p1);
    //activateCard("locationRailroad", p2);
    //activateCard("repairs", p1);
    //activateCard("chairman", p1);
    testM = true;
    //p1.moveTo(38);
    //p1.runturn();
    p1.moveTo(5);
    buy(p1);
    p1.moveTo(15);
    buy(p1);
    p1.moveTo(25);
    buy(p1);
    p1.moveTo(35);
    buy(p1);
    //p1.moveTo
    
    
  }
  
}
*/

 

public void buy(piece p)
{   
      p.setMoney(p.getMoney()- allSpaces.get(p.onSpace).getPrice());
      p.getOwns().add(allSpaces.get(p.onSpace));
      allSpaces.get(p.onSpace).setOwn(true);
      if(p.getRed() == 255)
      {
        allSpaces.get(p.onSpace).setOwnColor("Red");
      }
      else if(p.getGreen() == 255)
      {
        allSpaces.get(p.onSpace).setOwnColor("Green");
      }
      else if(p.getBlue() == 255)
      {
        allSpaces.get(p.onSpace).setOwnColor("Blue");
      }
      else
      {
        allSpaces.get(p.onSpace).setOwnColor("Black");
      }
      bought = true;
}
public void mortgageProperty(piece p)
{
  if(mousePressed)
  {
    for(int i = 0; i < p.owns.size(); i++)
    {
      if(mouseX - p.owns.get(i).x >= 0 && mouseX - p.owns.get(i).x < p.owns.get(i).w 
      && mouseY - p.owns.get(i).y >= 0 && mouseY - p.owns.get(i).y < p.owns.get(i).h)
      {
        if(p.owns.get(i).getMortgaged())
        {
          p.setMoney(int(p.money - (p.owns.get(i).getPrice()/2 + .05*p.owns.get(i).getPrice())));
          p.owns.get(i).setMortgaged(false);
        }
        else
        {
          p.setMoney(p.money + (p.owns.get(i).getPrice() / 2));
          p.owns.get(i).setMortgaged(true);
        }
      }
    }
    startMortgage = false;
  }
}
public void buyHouse(piece p)
{
  //what is getting traded must be vars in piece class
  if(mousePressed)
  {
    for(int i = 0; i < p.owns.size(); i++)
    {
      if(mouseX - p.owns.get(i).x >= 0 && mouseX - p.owns.get(i).x < p.owns.get(i).w 
      && mouseY - p.owns.get(i).y >= 0 && mouseY - p.owns.get(i).y < p.owns.get(i).h)
      {
        // use getters when referenceing a variable only present in propspace
        //purple
        if(p.owns.get(i).name.equals("mediterranean") && p.purpleMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 50);
          adjustHouse(i, p, 10, 30, 90, 160, 250);
        } 
        if(p.owns.get(i).name.equals("baltic") && p.purpleMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 50);
          adjustHouse(i, p, 20, 60, 180, 320, 450);
        }
        
        //light blue
        if(p.owns.get(i).name.equals("vermont") && p.lightBlueMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 50);
          adjustHouse(i, p, 30, 90, 270, 400, 550);
        }  
        if(p.owns.get(i).name.equals("oriental") && p.lightBlueMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 50);
          adjustHouse(i, p, 30, 90, 270, 400, 550);
        } 
        if(p.owns.get(i).name.equals("connecticut") && p.lightBlueMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 50);
          adjustHouse(i, p, 40, 100, 300, 450, 600);
        } 
        
        //pink
        if(p.owns.get(i).name.equals("states") && p.pinkMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 100);
          adjustHouse(i, p, 50, 150, 450, 625, 750);
        }
        if(p.owns.get(i).name.equals("st charles") && p.pinkMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 100);
          adjustHouse(i, p, 50, 150, 450, 625, 750);
        }   
        if(p.owns.get(i).name.equals("virginia") && p.pinkMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 100);
          adjustHouse(i, p, 60, 180, 500, 700, 900);
        }
        
        //oarnge
        if(p.owns.get(i).name.equals("st james") && p.oarngeMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 100);
          adjustHouse(i, p, 70, 200, 550, 750, 950);
        } 
        if(p.owns.get(i).name.equals("tennessee") && p.oarngeMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 100);
          adjustHouse(i, p, 70, 200, 550, 750, 950);
        }
        if(p.owns.get(i).name.equals("new york") && p.oarngeMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 100);
          adjustHouse(i, p, 80, 220, 600, 800, 1000);
        }
        
        //red
        if(p.owns.get(i).name.equals("indiana") && p.redMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 150);
          adjustHouse(i, p, 90, 250, 700, 875, 1050);
        } 
        if(p.owns.get(i).name.equals("kentucky") && p.redMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 150);
          adjustHouse(i, p, 90, 250, 700, 875, 1050);
        } 
        if(p.owns.get(i).name.equals("illinois") && p.redMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 150);
          adjustHouse(i, p, 100, 300, 750, 925, 1100);
        }
        
        //yellow
        if(p.owns.get(i).name.equals("ventnor") && p.yellowMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 150);
          adjustHouse(i, p, 110, 330, 800, 975, 1150);
        }
        if(p.owns.get(i).name.equals("atlantic") && p.yellowMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 150);
          adjustHouse(i, p, 110, 330, 800, 975, 1150);
        }
        if(p.owns.get(i).name.equals("marvin") && p.yellowMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 150);
          adjustHouse(i, p, 120, 360, 850, 1025, 1200);
        }
        
        //green
        if(p.owns.get(i).name.equals("north carolina") && p.greenMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 200);
          adjustHouse(i, p, 130, 390, 900, 1100, 1275);
        }
        if(p.owns.get(i).name.equals("pacific") && p.greenMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 200);
          adjustHouse(i, p, 130, 390, 900, 1100, 1275);
        }
        if(p.owns.get(i).name.equals("pennsylvania ave") && p.greenMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 200);
          adjustHouse(i, p, 150, 450, 1000, 1200, 1400);
        }
        
        //blue
        if(p.owns.get(i).name.equals("park place") && p.blueMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 200);
          adjustHouse(i, p, 175, 500, 1100, 1300, 1500);
        }
        if(p.owns.get(i).name.equals("boardwalk") && p.blueMonopoly && p.owns.get(i).getHouses() < 5)
        {
          p.setMoney(p.money - 200);
          adjustHouse(i, p, 200, 600, 1400, 1700, 2000);
        }   
        
      }
    }
    startHouse = false;
    println("med "+"houses "+ allSpaces.get(1).getHouses()+" "+allSpaces.get(1).getCost());
    println("baltic "+"houses "+ allSpaces.get(3).getHouses()+" "+allSpaces.get(3).getCost());
  }
}


public void adjustHouse(int i, piece p, int house1, int house2, int house3, int house4, int house5)
{
    if(p.owns.get(i).getHouses() == 0)
    {
      p.owns.get(i).setCost(house1);
      p.owns.get(i).setHouses(1);
      return;
    }
    if(p.owns.get(i).getHouses() == 1)
    {
      p.owns.get(i).setCost(house2);
      p.owns.get(i).setHouses(2);
      return;
    }
    if(p.owns.get(i).getHouses() == 2)
    {
      p.owns.get(i).setCost(house3);
      p.owns.get(i).setHouses(3);
      return;
    }
    if(p.owns.get(i).getHouses() == 3)
    {
      p.owns.get(i).setCost(house4);
      p.owns.get(i).setHouses(4);
      return;
    }
    if(p.owns.get(i).getHouses() == 4)
    {
      p.owns.get(i).setCost(house5);
      p.owns.get(i).setHouses(5);
      return;
    }
}

public void activateCard(String s, piece p)
{
  if(diceNum != dice2Num)
  {
     NotRolled = false;
  }
  if(s.substring(0,1).compareTo("9") >= -12 && s.substring(0,1).compareTo("9") <= 0)
  {
    println("CARD TEST " + p.money);
    int cardVal = Integer.parseInt(s);
    p.setMoney(p.money + cardVal);
    println("" + p.money);
  }
  
  if(s.length() > 8)
  {
    print(s.length() > 8);
    print(s);
    if(s.substring(0,8).equals("location") && s.length() < 11)
    {
      int newLoc = Integer.parseInt(s.substring(8));
      p.moveTo(newLoc);
      p.runturn();
    }
    
    if(s.substring(0,8).equals("location") && s.length() > 11)
    {
      if(s.substring(8,s.length()).equals("Railroad"))
      {
        activateAdvanceNearestCard("black", p);
      }
      if(s.substring(8,s.length()).equals("Utility"))
      {
        activateAdvanceNearestCard("rambow", p);
      }
      
    }
  }
  if( s.equals("go"))
  {
    p.moveTo(0);
  }
  if(s.equals("jail"))
  {
    p.setJail(true);
    p.moveTo(10);
  }
  if(s.equals("back3"))
  {
    p.moveTo(p.onSpace-3);
    p.runturn();
  }
  if(s.equals("jailFree"))
  {
    p.setFreeCard(true);
  }
  if(s.equals("chairman"))
  {
    for(int i = 0; i < playing.size(); i++)
    {
      if(p.rval != playing.get(i).rval || p.gval != playing.get(i).gval || p.bval != playing.get(i).bval)
      {
        p.setMoney(p.money-50);
        playing.get(i).setMoney( playing.get(i).money+50);
      }
    }
  }
  
  if(s.equals("every50"))
  {
    for(int i = 0; i < playing.size(); i++)
    {
      if(p.rval != playing.get(i).rval || p.gval != playing.get(i).gval || p.bval != playing.get(i).bval)
      {
        p.setMoney(p.money+50);
        playing.get(i).setMoney(playing.get(i).money - 50);
      }
    }
  }
  
  if(s.equals("repairs"))
  {
    for(int i = 0; i < p.owns.size(); i++)
    {
      if(p.owns.get(i).getHouses() > 0 && p.owns.get(i).getHouses() < 5)
      {
        p.setMoney(p.money - 25*p.owns.get(i).getHouses());
      }
      if(p.owns.get(i).getHouses() == 5)
      {
        p.setMoney(p.money - 100);
      }
    }
  }

}

public void activateAdvanceNearestCard(String c, piece p)
{
  boolean advanceTo = false;
  boolean passGo = false;
  for(int i = p.onSpace; advanceTo == false; i++)
  {
    if(i > 39)
    {
      i -= 40;
      passGo = true;
    }
    if(allSpaces.get(i).getColor().equals(c))
    {
      p.moveTo(i); 
      if(passGo)
      {
        p.setMoney(p.money+200);
      }
      advanceTo = true;
      advanceSpace = i;
    }
  }
  doubleCost = true;
  if(allSpaces.get(advanceSpace).getClass() != utilspace.class)
  {
    allSpaces.get(advanceSpace).setCost(allSpaces.get(advanceSpace).getCost()*2);
  }
  p.runturn();
  //allSpaces.get(advanceSpace).setCost(allSpaces.get(advanceSpace).getCost()/2);
}

public boolean isPlaying(piece p)
{
  for(int i = 0; i < playing.size(); i++)
  {
    if(p.rval == playing.get(i).rval && p.gval == playing.get(i).gval && p.bval == playing.get(i).bval)
    {
      return true;
    }
  }
  return false;
}
public String listProps( ArrayList<space> s)
{
  String list = "";
  for(int i = 0; i < s.size(); i++)
  {
    list += (s.get(i).name+ " ");
    if(i%1 == 0 && i!= 1)
    {
      list+= "\n";
    }
  }
  return list;
}
public void clearTrade(piece p)
{
  p.setMoneyTrade(0);
  p.setOfferedPlayer("");
  p.setTradeSubmit(false);
  for(int i = 0; i <p.propTrade.size(); i++)
  {
    p.propTrade.remove(0);
  }
  startTrade = false;
  playerSelected = false; //checks if second player for tradehas been chosen
  dontAdd = false; //keeps the same property from adding multiple times w/ trading
  tradeDecide = false;
}
