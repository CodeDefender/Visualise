class drawGraphCircular{
  void drawLine(int radius,int x,int y,int no_of_points,int arr[][],int sink,int tank)
{ int angle=0;
  Arrow d = new Arrow();
  float x_pos[]=new float[no_of_points];
  float y_pos[]=new float[no_of_points];
  float xv_pos[]=new float[no_of_points];
  float yv_pos[]=new float[no_of_points];
  String str1[]={"V1","V2","V3","V4","V5","V6","V7","V8","V9","V10","V11","V12","V13","V14","V15","V16","V17","V18"};
    for(int i=0;i<no_of_points;i++)
    {
      x_pos[i]=x+radius*cos(PI*(90+angle)/180);
      y_pos[i]=y-radius*sin(PI*(90+angle)/180);
      xv_pos[i]=x+(radius+8)*cos(PI*(90+angle)/180);
      yv_pos[i]=y-(radius+8)*sin(PI*(90+angle)/180);
    
        fill(80, 1, 153);
        textSize(14);
        strokeWeight(3);
        point(x_pos[i],y_pos[i]);
        if(i!=sink&&i!=tank)
        text(str1[i],xv_pos[i],yv_pos[i]);
        else if(i==sink)
         text("sink",xv_pos[i],yv_pos[i]);
         else
          text("tank",xv_pos[i],yv_pos[i]);
        
        strokeWeight(2);
    
     angle+=360/no_of_points;
    }
    for(int i=0;i<no_of_points;i++)
       for(int j=0;j<no_of_points;j++)
       if(arr[i][j]>0)
       {strokeWeight(1);
        d.drawArrow(x_pos[i],y_pos[i],x_pos[j],y_pos[j],0,8,false);
        String str=Integer.toString(arr[i][j]);
        fill(0, 102, 153);
        textSize(14);
        strokeWeight(8);
        text(str,(x_pos[i]+x_pos[j])/2,(y_pos[i]+y_pos[j])/2);
        strokeWeight(1);
        
       }
    
  }
}
