class MaxFlow_Force
{ 
  float d;
  float x, y ,wid , hei ;
   float arr_x[];  // store x position of point
   float arr_y[]; 
   String str1[]={"SINK","V2","V3","V4","V5","V6","V7","V8","V9","V10","V11","V12","V13","V14","V15","V16","V17","V18","V19","TANK"};
  void intialize_points(String str[] , float left_corner_x, float left_corner_y, float right_corner_x, float right_corner_y)
  
  {
    Mlen = str.length;
     x = left_corner_x ;y = left_corner_y ; wid = right_corner_x ;hei = right_corner_y;
 
    // Initialising the array i.e. defining size
    Mgraph= new int[str.length][str.length];
    
    arr_x= new float[Mlen];
    arr_y= new float[Mlen];
    
    
   
    frameRate(1500);
    
    // Randomly choosing the points
      for(int i=1;i<Mlen-1;i++)           // 1 to len-1 removing source and sink    
    {
      arr_x[i]=random(x + 30,x + wid-30);
      arr_y[i]=random(y + 30,y + hei-30);
      print("x["+i+"] = "+arr_x[i]+"   y["+i+"] = "+arr_x[i]+"\n");
    }
      arr_x[0] = x;
      arr_y[0] = y + hei/2;
      arr_x[Mlen-1] = x + wid;
      arr_y[Mlen-1] = y + hei/2;
    
  }
    
  void drawGraph(int Arr [][] )
  {  
     fill(195,207,224);
     strokeWeight(0);
     rect(x,y,wid,hei);
     
     strokeWeight(11);
     strokeWeight(3);
    boundary_rep();
    for(int i=0;i<Mlen;i++)
      for(int j=0;j<Mlen;j++)
        { 
          if(Arr[i][j]>0)
          {
           //stroke(20,240,30);
           stroke(221,132,73);
           fill(171,14,62);
           strokeWeight(2);
          // print("x1= " + arr_x[i]+ "y1 = " +arr_y[i] + "x2= " + arr_x[j]+ "yj = " +arr_y[j] );
           cal_force(i,j);   
        /*   if(ans_graph[i][j] > 0)
             { stroke(0,250,0);
               strokeWeight(3);
             } */
           a.drawArrow(arr_x[i],arr_y[i],arr_x[j],arr_y[j],0,7,true);
             
             
              strokeWeight(5);
              fill(0);
              text(Mgraph[i][j]+" ("+Mans_graph[i][j]+")",(arr_x[i]+arr_x[j])/2,(arr_y[i]+arr_y[j])/2);  // for labeling edges
              strokeWeight(2);
             
          }
          else if(i!=j)
          {
          cal_rep(i,j);
          }
        }
        for(int i=1;i<Mlen-1;i++)
      { strokeWeight(8);
        stroke(0);
        point(arr_x[i],arr_y[i]);
        fill(0, 0, 0);
        text(str1[i],arr_x[i],arr_y[i]);
      }
      text(str1[0],arr_x[0]-50,arr_y[0]+5);           // for first vertice i.e. 'SINK'
      text(str1[19],arr_x[Mlen-1],arr_y[Mlen-1]);   // for last vertice i.e. 'TANK'
  }
      void basic_draw(int Arr[][])
     {
       for(int i=0;i<Mlen;i++)
         for(int j=0;j<Mlen;j++)
        { 
          if(Arr[i][j]!=0)
          {
           stroke(random(9,255),random(5,244),random(5,244));
           line(arr_x[i],arr_y[i],arr_x[j],arr_y[j]);
          }
        }
     }
    
  void cal_force(int i,int j)
  {
      d=sqrt(abs( (arr_x[i]-arr_x[j])*(arr_x[i]-arr_x[j]) + (arr_y[i]-arr_y[j])*(arr_y[i]-arr_y[j]) )) ;
      float r;
      float force= 0.9*(d-Md_px);
      float cos_theta = (arr_x[j]-arr_x[i]) / d;
      float sin_theta = (arr_y[j]-arr_y[i]) / d;
      
      if(force > 0)
       { r= map((d-Md_px)*(d-Md_px),0,160000,0,30);
       if(j!=0 && j!=Mlen-1)
       {
        arr_x[j]= arr_x[j] - r*cos_theta;
        arr_y[j]= arr_y[j] - r*sin_theta;
       }
       if(i!=0 && i!=Mlen-1)
       {
        arr_x[i]= arr_x[i] + r*cos_theta;
        arr_y[i]= arr_y[i] + r*sin_theta;
       }
       }
       if(force < 0)
       { r= map((Md_px-d)*(Md_px-d),0,160000,0,30);
       if(j!=0 && j!=Mlen-1)
       {
        arr_x[j]= arr_x[j] + r*cos_theta;
        arr_y[j]= arr_y[j] + r*sin_theta;
       }
       if(i!=0 && i!=Mlen-1)
       {
        arr_x[i]= arr_x[i] - r*cos_theta;
        arr_y[i]= arr_y[i] - r*sin_theta;
       }
       }
     
   }
   
    void cal_rep(int i ,int j)
    {
      d=sqrt(abs( (arr_x[i]-arr_x[j])*(arr_x[i]-arr_x[j]) + (arr_y[i]-arr_y[j])*(arr_y[i]-arr_y[j]) )) ;
      float force=  160000/(d+1);
     // print("  force   = +"+force+"\n");
      //print("  d   = +"+d+"\n");
      float r = map(force,0,160000,0,30);
     // print("  r   = +"+r+"\n");
      
      float cos_theta = (arr_x[j]-arr_x[i]) / d;
      float sin_theta = (arr_y[j]-arr_y[i]) / d;
     if(j!=0 && j!=Mlen-1)
     {
      arr_x[j]= arr_x[j] + r*cos_theta;
      arr_y[j]= arr_y[j] + r*sin_theta;
     }
     if(i!=0 && i!=Mlen-1)
     {
      arr_x[i]= arr_x[i] - r*cos_theta;
      arr_y[i]= arr_y[i] - r*sin_theta;
     }
    }
     
     void boundary_rep()
      {
        for(int i=1;i<Mlen-1;i++)
        {
       // float force1 = (width*width)/(arr_x[i] * arr_x[i]) - (width*width)/((width-arr_x[i])*(width-arr_x[i]));
        float force1 = (wid)/(arr_x[i] - x) - (wid)/(( wid-arr_x[i] +x));
        float r1 ;
        if(force1 > 0)
        {
          r1 = map(force1,0,wid,0,wid/12);
          r1=r1*r1;
          arr_x[i] = arr_x[i] + r1;
        }
       
        if(force1 < 0)
        {
          r1 = map(-force1,0,wid,0,wid/12);
          r1=r1*r1;
          arr_x[i] = arr_x[i] - r1;
        }
       // float force2 = (height*height)/(arr_y[i] * arr_y[i]) - (height*height)/((height-arr_y[i])*(height-arr_y[i]));
        float force2 = (hei)/(arr_y[i] - y ) - (hei)/((hei-arr_y[i] + y));
        float r2 ;
        
        if(force2 > 0)
        {
           r2 = map(force2,0,hei,0,hei/12);
           r2=r2*r2;
           arr_y[i] = arr_y[i] + r2;
        }
       
        if(force2 < 0)
        {
           r2 = map(-force2,0,hei,0,hei/12);
           r2=r2*r2;
           arr_y[i] = arr_y[i] - r2;
        }
      //  print("\n force1 [ "+i+"] = " + arr_x[i] + "  force2 [ "+i+"] = " +arr_y[i] );
        }
      }
}    
      
  
