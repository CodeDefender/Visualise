class drawGraph {
 
  void drawLine(int no_of_supplier,int no_of_demanders,int arr[][])
  { 
    String str1[]={"S1","S2","S3","S4","S5","S6","S7","S8","S9","S10","S11","S12","S13","S14","S15","S16","S17","S18"};
    String str2[]={"D1","D2","D3","D4","D5","D6","D7","D8","D9","D10","D11","D12","D13","D14","D15","D16","D17","D18"};
    float x_pos_s[]=new float[no_of_supplier];
    float y_pos_s[]=new float[no_of_supplier];
    strokeWeight(0);
    textSize(18);
    
    fill(0,0,0);
    Arrow a= new Arrow();
    
    float inc_pos_s_y =height/(5+1.5*no_of_supplier);
    float add_s = inc_pos_s_y;
    int pos_s_x = 500;  
    if(no_of_supplier%2==0)
    {
      
      for(int i=0;i<no_of_supplier;i+=2)
      { 
        x_pos_s[i] = pos_s_x;
        y_pos_s[i] = height/3 + inc_pos_s_y;
        x_pos_s[i+1] = pos_s_x;
        y_pos_s[i+1] = height/3 - inc_pos_s_y;
        inc_pos_s_y+=add_s;
        noStroke();
        point(x_pos_s[i],y_pos_s[i]);
        point(x_pos_s[i+1],y_pos_s[i+1]);
        fill(68,104,170);
        ellipse(x_pos_s[i]-8,y_pos_s[i],40,40);
        
        
        ellipse(x_pos_s[i+1]-8,y_pos_s[i+1],40,40);
        fill(0,0,0);
        text(str1[i],x_pos_s[i]-18,y_pos_s[i]);           // -5 for labelling little before the vertex
        text(str1[i+1],x_pos_s[i+1]-18,y_pos_s[i+1]);
      }
    }
    else
    { int i=0;
      do
       {
         if(i>0)
         {
          x_pos_s[i] = pos_s_x;
          y_pos_s[i] = height/3 + inc_pos_s_y;
          x_pos_s[i+1] = pos_s_x;
          y_pos_s[i+1] = height/3 - inc_pos_s_y;
          inc_pos_s_y+=add_s;
          
        noStroke();
        point(x_pos_s[i],y_pos_s[i]);
         point(x_pos_s[i+1],y_pos_s[i+1]);
         fill(68,104,170);
        ellipse(x_pos_s[i]-8,y_pos_s[i],40,40);       
        ellipse(x_pos_s[i+1]-8,y_pos_s[i+1],40,40);
        fill(0,0,0);
        text(str1[i],x_pos_s[i]-18,y_pos_s[i]);
        text(str1[i+1],x_pos_s[i+1]-18,y_pos_s[i+1]);
        i=i+2;
         }
         if(i==0)
         {
           x_pos_s[i] = pos_s_x;
           y_pos_s[i] = height/3 ;
            noStroke();
            point(x_pos_s[i],y_pos_s[i]);
            fill(68,104,170);
            ellipse(x_pos_s[i]-8,y_pos_s[i],40,40);
            fill(0,0,0);
            text(str1[i],x_pos_s[i]-18,y_pos_s[i]);
             i=i+1;
         }
       }while(i<no_of_supplier-1);
    }
    
    float x_pos_d[]=new float[no_of_demanders];
    float y_pos_d[]=new float[no_of_demanders];
    
    float inc_pos_d_y = /*mouseY*/height/*(0.006*(mt+200)*//(5+1.5*no_of_demanders);
    float add_d = inc_pos_d_y;
    int pos_d_x = 800;
      
    if(no_of_demanders%2==0)
    {
      
      for(int i=0;i<no_of_demanders;i+=2)
      { 
        x_pos_d[i] = pos_d_x;
        y_pos_d[i] = height/3 + inc_pos_d_y;
        x_pos_d[i+1] = pos_d_x;
        y_pos_d[i+1] = height/3 - inc_pos_d_y;
        inc_pos_d_y+=add_d;
        noStroke();
        point(x_pos_d[i],y_pos_d[i]);
        point(x_pos_d[i+1],y_pos_d[i+1]);
        fill(68,104,170);
        ellipse(x_pos_d[i]+25,y_pos_d[i],40,40);              
        ellipse(x_pos_d[i+1]+25,y_pos_d[i+1],40,40);
        fill(0,0,0);
         text(str2[i],x_pos_d[i]+15,y_pos_d[i]);        // + 5 for labelling little after the vertice
        text(str2[i+1],x_pos_d[i+1]+15,y_pos_d[i+1]);
      }
    }
    else
    { int i=0;
      do
       {
         if(i>0)
         {
          x_pos_d[i] = pos_d_x;
          y_pos_d[i] = height/3 + inc_pos_d_y;
          x_pos_d[i+1] = pos_d_x;
          y_pos_d[i+1] = height/3 - inc_pos_d_y;
          inc_pos_d_y+=add_d;
        
        noStroke();
        point(x_pos_d[i],y_pos_d[i]);
        point(x_pos_d[i+1],y_pos_d[i+1]);
        fill(68,104,170);
        ellipse(x_pos_d[i]+25,y_pos_d[i],40,40);
        ellipse(x_pos_d[i+1]+25,y_pos_d[i+1],40,40);
        fill(0,0,0);
        text(str2[i],x_pos_d[i]+15,y_pos_d[i]);
        text(str2[i+1],x_pos_d[i+1]+15,y_pos_d[i+1]);
        i=i+2;
         }
         if(i==0)
         {
           x_pos_d[i] = pos_d_x;
           y_pos_d[i] = height/3;
         noStroke();
        point(x_pos_d[i],y_pos_d[i]);
        fill(68,104,170);
        ellipse(x_pos_d[i]+25,y_pos_d[i],40,40);
        fill(0,0,0);
        text(str2[i],x_pos_d[i]+15,y_pos_d[i]);
        i=i+1;
         }
       }while(i<no_of_demanders-1);
    }
    //print("HEllo paras");
     
    for(int i=0;i<no_of_supplier;i++)
       for(int j=0;j<no_of_demanders;j++)
        if(arr[i][j]!=0)
       {
         fill(128,5,4);
         stroke(0,100,80);
         strokeWeight(2);
        // line(x_pos_s[i],y_pos_s[i],x_pos_d[j],y_pos_d[j]);
           a.drawArrow(x_pos_s[i],y_pos_s[i],x_pos_d[j],y_pos_d[j],0,3,true);
         text(arr[i][j],(x_pos_s[i]*1+x_pos_d[j]*3)/4,(y_pos_s[i]*1+y_pos_d[j]*3)/4);
         
       }
 }
}
       
    
        
        
       
