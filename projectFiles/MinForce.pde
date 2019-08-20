class MinForce
{ 
  float d;
  float x, y ,wid ,hei ;
   float arr_x[];  // store x position of point
   float arr_y[]; 
   String str1[]={"V1","V2","V3","V4","V5","V6","V7","V8","V9","V10","V11","V12","V13","V14","V15","V16","V17","V18"};
  void intialize_points(String str[] , float left_corner_x, float left_corner_y, float right_corner_x, float right_corner_y)
  
  {
    mlen = str.length;
     x = left_corner_x ;y = left_corner_y ; wid = right_corner_x ; hei= right_corner_y;
 
    // Initialising the array i.e. defining size
    mgraph= new int[str.length][str.length];
    
    arr_x= new float[mlen];
    arr_y= new float[mlen];
  
    frameRate(1500);
    
    // Randomly choosing the points
      for(int i=0;i<mlen;i++)               
    {
      arr_x[i]=random(x + 30,x + wid-30);
      arr_y[i]=random(y + 30,y + hei-30);
      print("x["+i+"] = "+arr_x[i]+"   y["+i+"] = "+arr_x[i]+"\n");
    }
  }
    
  void drawGraph(int Arr [][] )
  {  
     fill(205);
     strokeWeight(0);
     rect(x,y,wid,hei);
     strokeWeight(3);
    boundary_rep();
    for(int i=0;i<mlen;i++)
      for(int j=0;j<mlen;j++)
        { 
          if(Arr[i][j]!=0)
          {
           stroke(165,85,61);
           strokeWeight(1.5);
          // print("x1= " + arr_x[i]+ "y1 = " +arr_y[i] + "x2= " + arr_x[j]+ "yj = " +arr_y[j] );
           cal_force(i,j);   
           if(msp_tree[i][j] != 0)
             { stroke(90,54,11);
               strokeWeight(5);
             }
           line(arr_x[i],arr_y[i],arr_x[j],arr_y[j]);
             
             
              strokeWeight(4);
              fill(3);
              textFont(fontItalic,30);
              text(mgraph[i][j],(arr_x[i]+arr_x[j])/2,(arr_y[i]+arr_y[j])/2);  // for labeling vertices
              textFont(font,16);
              strokeWeight(19);
             
          }
          else if(i!=j)
          {
          cal_rep(i,j);
          }
        }
        for(int i=0;i<mlen;i++)
      { strokeWeight(26);
        fill(98,57,13);
        ellipse(arr_x[i],arr_y[i],20,20);
        fill(220, 228, 130);
        text(str1[i],arr_x[i],arr_y[i]);
      }
  }
      void basic_draw(int Arr[][])
     {
       for(int i=0;i<mlen;i++)
         for(int j=0;j<mlen;j++)
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
      float force= 0.9*(d-md_px);
      float cos_theta = (arr_x[j]-arr_x[i]) / d;
      float sin_theta = (arr_y[j]-arr_y[i]) / d;
      
      if(force > 0)
       { r= map((d-md_px)*(d-md_px),0,160000,0,30);
        arr_x[j]= arr_x[j] - r*cos_theta;
        arr_y[j]= arr_y[j] - r*sin_theta;
        arr_x[i]= arr_x[i] + r*cos_theta;
        arr_y[i]= arr_y[i] + r*sin_theta;
       }
       if(force < 0)
       { r= map((md_px-d)*(md_px-d),0,160000,0,30);
        arr_x[j]= arr_x[j] + r*cos_theta;
        arr_y[j]= arr_y[j] + r*sin_theta;
        arr_x[i]= arr_x[i] - r*cos_theta;
        arr_y[i]= arr_y[i] - r*sin_theta;
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
    
      arr_x[j]= arr_x[j] + r*cos_theta;
      arr_y[j]= arr_y[j] + r*sin_theta;
      arr_x[i]= arr_x[i] - r*cos_theta;
      arr_y[i]= arr_y[i] - r*sin_theta;
    }
     
     void boundary_rep()
      {
        for(int i=0;i<mlen;i++)
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
        print("\n force1 [ "+i+"] = " + arr_x[i] + "  force2 [ "+i+"] = " +arr_y[i] );
        }
      }
}    
      
  
