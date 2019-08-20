import java.util.LinkedList;
import java.util.*;
import java.lang.*;
import java.io.*;
import java.util.LinkedList;
import controlP5.*;
ControlP5 cp5;
PFont font;
PFont fontItalic;
PFont ArialItalic;
PFont font1;
PImage bg;
//------------------------------------------------- Interface varialbles -----------------------------------------------------------------------------
float MrectX=650,MrectY=190;
float mrectX=650,mrectY=240;
float trectX=650,trectY=290;
boolean max_flow = false;
boolean min_sp = false;
boolean tp = false;

//---------------------------------------------------- Funtions for selecting Problems ----------------------------------------------------------------
boolean checkMaxflow()
{
  if(mouseX < MrectX+35 && mouseX > MrectX-35 && mouseY < MrectY +18 && mouseY > MrectY-18)
   return true;
 return false;
  
}
boolean checkMin_sp()
{
  if(mouseX < mrectX+35 && mouseX > mrectX-35 && mouseY < mrectY +18 && mouseY > mrectY-18)
   return true;
 return false;
  
}
boolean checkTrans()
{
  if(mouseX < trectX+35 && mouseX > trectX-35 && mouseY < trectY +18 && mouseY > trectY-18)
   return true;
 return false;
  
}
//------------------------------------------------Variables for minimum spanning tree---------------------------------------------------------

static int mgraph[][];       //for full graph i.e original matrix
static int msp_tree[][];     // Final spanning tree matrix
static float md_px= 350;     // restrict the length of edge
static int mlen;
MinForce mf1= new MinForce();
int mcount=5;
static int manswer;
static int mctr=1;

//------------------------------------------------Variables for Transportation Problem-----------------------------------------------------------

int tcount=5;               // for drawing graph at perfect time
static int tfinal_supply[][];
static int tS;
static int tD;
static int tctr=1;
int tanswer=0;

//------------------------------------------------Variables for Maximum flow Problem ---------------------------------------------------------------

static int Mgraph[][];
static int Mans_graph[][];
static float Md_px= 250;    // restrict the length of edge

static int Mlen;
int test=0;

MaxFlow_Force Mf1= new MaxFlow_Force();
Arrow a = new Arrow();

int Mcount=5;
int Manswer=0;
//-------------------------------------------------variable to control flow across problems------------------------------------------------------------
static int Mctr=1;
static int move=1;

//---------------------------------------------------setup()--------------------------------------------------------------------------------------------
void setup()
{  
  size(1920,1080);
  font=createFont("Arial Bold",18);
  fontItalic=createFont("Times New Roman Italic",16);
  ArialItalic=createFont("Corbel Bold",16);
  bg=loadImage("image.png");
}
//---------------------------------------------------draw()----------------------------------------------------------------------------------------------
void draw(){ 
 // background(141,155,214);
 background(211,209,156);
  textFont(font,28);
  rectMode(CENTER);
  fill(166,168,217);
  rect(416,240,749,172);
  
  fill(53,76,119);
  rect(MrectX,MrectY,70,35);
  rect(mrectX,mrectY,70,35);
  rect(trectX,trectY,70,35);
  rectMode(CORNER);
  
  if(move==1)
  {
  fill(137,19,19);
  textFont(ArialItalic,35);
  text(" Press button to choose the problem",80,96);
  fill(3,3,3);
  textFont(fontItalic,29);
  text(" 1.   Maximal Flow Problem",100,200);
  text(" 2.   Minimum spaning tree Problem",100,250);
  text(" 3.   Transportation Problem",100,300);
  }
  textFont(font,28);
  if (mousePressed||move!=1) {
    max_flow=checkMaxflow();
    if (max_flow||move==2) {
       draw1();
       move=2;
    }
//  }
  
  
  //if (mousePressed||move==3) {
    min_sp=checkMin_sp();
    if (min_sp||move==3) {
       draw2();
       move=3;
    }
//  }
  
  
 // if (mousePressed||move==4) {
    tp=checkTrans();
    if (tp||move==4) {
       draw3();
       move=4;
    }
  }
  //if(keyPressed)
    if(mousePressed&&move==1)
     { //fill(113,200,255);
     fill(161,11,21);
       text(" !! Sorry wrong mouse clicked .... Try again",80,509);
     }
  
}
// -------------------------------------------------------   Maximal Flow Problem ---------------------------------------------------------------
void draw1()
{ //background(192,84,66);
  background(bg);
  if(Mctr==1)
  {
     cp5=new ControlP5(this);
 
  cp5.addBang("MSubmit").setPosition(170,670).setSize(80,40);
  Mctr=2;
  }
  textFont(font,28);
  
  fill(113,4,40);
  text("Maximum Flow Problem",550,55);
  textFont(font,22);
  text("Press Button : ",17,690);
  if(Mcount==1){
  fill(0);  
  text("Maximal flow is : "+Manswer,350,690);
  Mf1.drawGraph(Mgraph);
  if(test == 0)
  {
  print(" graph[i][j] \n");
  for(int i=0;i< Mlen ;i++)
    { for(int j=0;j<Mlen;j++)
     {
       print(" " + Mgraph[i][j]);
     }print("\n");
    }
   print(" ans_graph[i][j] \n ");
     for(int i=0;i< Mlen ;i++)
    { for(int j=0;j<Mlen;j++)
     {
       print(" " + Mans_graph[i][j]);
     }print("\n");
    }
    test =1;
  }   
  }
}
  void MSubmit()
{ 
 String Array[] = loadStrings("graph1.txt");
 Mf1.intialize_points(Array,240,90,900,550);
 
 Mans_graph = new int[Mlen][Mlen];
 for(int i=0;i<Array.length;i++)
       Mgraph[i]=int(split(Array[i]," "));
      //ans_graph = graph;
   for(int i=0;i< Mlen ;i++)
     for(int j=0;j<Mlen;j++)
     {
       Mans_graph[i][j] = Mgraph[i][j];
    }
  MaxFlow m=new MaxFlow();
  Manswer=m.fordFulkerson(Mgraph,0,Array.length-1,Mlen);
  Mcount=1;
  
  print("The maximum possible flow is " +Manswer);
}
// -------------------------------------------------------   minimum spanning tree ---------------------------------------------------------------
 void draw2()
  { 
    //background(202,182,227);
      background(211,209,156);
      if(mctr==1)
  {
      cp5=new ControlP5(this);
    cp5.addBang("mSubmit").setPosition(170,675).setSize(80,40);
  mctr=2;
  }
    strokeWeight(15);
    textFont(font,20);    
    fill(113,4,40);
    text("Press Button : ",17,698);
    textFont(font,24);
    fill(113,4,40);
    text("Minimum Spanning Tree Problem",500,40);
    textFont(font,20);
  
    if(mcount==1)
    {
      fill(113,4,40);  
      text("MST cost is : "+manswer,350,698);
      mf1.drawGraph(mgraph);
    }
  }
  void mSubmit()
  {
    String Array[] = loadStrings("mgraph1.txt");
    mf1.intialize_points(Array,100,55,1200,590);
    
    msp_tree = new int[mlen][mlen];

    for(int i=0;i<Array.length;i++)
       mgraph[i]=int(split(Array[i]," "));
  
    MST m = new MST();
    manswer = m.primMST(mgraph,mlen,msp_tree);
    mcount = 1;
    print("The minimum spanning tree cost is " +manswer);
  }
  // -------------------------------------------------------   Transportation Problem  ---------------------------------------------------------------
  
  void draw3()
{
  background(211,209,156);  
  
  if(tctr==1)
  {  cp5=new ControlP5(this);
     font1=createFont("Arial Bold",14);
     cp5.addTextfield("Supply_Array").setPosition(100,180).setSize(200,80).setFont(font1).setFocus(true).setAutoClear(false);
  cp5.addTextfield("Demand_Array").setPosition(400,180).setSize(200,80).setFont(font1).setAutoClear(false);
  cp5.addTextfield("No_of_Supplier").setPosition(100,90).setSize(200,40).setFont(font1).setAutoClear(false);
  cp5.addTextfield("No_of_Customers").setPosition(400,90).setSize(200,40).setFont(font1).setAutoClear(false);
  cp5.addTextfield("Graph").setPosition(100,300).setSize(200,200).setFont(font1).setAutoClear(false);
  cp5.addBang("tSubmit").setPosition(170,675).setSize(80,40);
  tctr=2;
  }
  textFont(ArialItalic,28);
  fill(113,4,40);
  text("Transportation Problem",570,40);
  textFont(font,20);
  text("Press Button : ",17,698);
  if(tcount==1)
  {
    textFont(ArialItalic,24);
  text("Minimum cost is : "+tanswer,100,650);
  drawGraph d=new drawGraph();
  d.drawLine(tS,tD,tfinal_supply);
  cp5.remove("Graph");
  cp5.remove("Supply_Array");
  cp5.remove("Demand_Array");
  cp5.remove("No_of_Customers");
  cp5.remove("No_of_Supplier");
  cp5.remove("tSubmit");
  }
}
  
void tSubmit()
{ 
    tS=int(cp5.get(Textfield.class,"No_of_Supplier").getText());
    tD=int(cp5.get(Textfield.class,"No_of_Customers").getText());
 String txt=cp5.get(Textfield.class,"Graph").getText();
 int [] Array=int(split(txt," "));
 int [][]graph=new int[tS][tD];
     tfinal_supply=new int[tS][tD];
 for(int i=0,l=(i/tD),m=i%tD;i<Array.length;i++,l=(i/tD),m=i%tD)
 {
   graph[l][m]=Array[i];
  // print(i);
  
 }
 
 int [] supplly=int (split(cp5.get(Textfield.class,"Supply_Array").getText()," "));
 int [] demand=int(split(cp5.get(Textfield.class,"Demand_Array").getText()," "));
 
  vogels t=new vogels();
  t.setColumn(tD);
  t.setRows(tS);
  t.getData(graph,supplly,demand);
  t.makeAllocation();
  tanswer=t.display(tfinal_supply); 
  tcount=1;
  print("The maximum possible flow is " +tanswer);
}
