  class vogels{
  final int MAX=50;
  int data[][]=new int[MAX][MAX];
  int requered[]=new int [MAX];
  int capacity[]=new int [MAX];
  int allocation[][]=new int [MAX][MAX];
  int no_of_rows,no_of_columns,no_of_allocation;
  vogels()
  { 
    for(int i=0;i<MAX;i++){
      capacity[i]=0;
      requered[i]=0;
      for(int j=0;j<MAX;j++){
        data[i][j]=0;
        allocation[i][j]=0;
      }
    }
    no_of_rows=no_of_columns=no_of_allocation=0;
  }//end of constructor
  void setColumn(int no){
    no_of_columns=no;}
  void setRows(int no){
    no_of_rows=no;
  }

  void getData(int graph[][],int supplly[],int demand[]){
    for(int i=0;i<no_of_rows;i++)
       {
         for(int j=0;j<no_of_columns;j++)
          {
            data[i][j]=graph[i][j]; 
          }
       }
    for(int i=0;i<no_of_rows;i++)
    capacity[i]=supplly[i];
    for(int i=0;i<no_of_columns;i++)
    requered[i]=demand[i];
  }    //end of getdata
  
  void copy2DArray(int startRow,int startCol,int endRow,int endCol,int array[][]
  ,int start1Row,int start1Col,int ans[][]){
    for(int i=startRow,k=start1Row;i<endRow;i++,k++)
        for(int j=startCol,l=start1Col;j<endCol;j++,l++)
            ans[k][l]=array[i][j];
}

  void makeAllocation(){
    int i=0,j=0,min,total_min;
    int temp_requered[]=new int [MAX];
    int temp_capacity[]=new int [MAX];
    int temp_data[][]=new int [MAX][MAX];
    int position[]=new int [MAX];
    int dataPos[]=new int [MAX];
    int sum_of_cap,sum_of_req;
    sum_of_cap=getTotal(capacity,no_of_rows);
    sum_of_req=getTotal(requered,no_of_columns);
    if(sum_of_cap!=sum_of_req){
        if(sum_of_cap>sum_of_req){
            for(j=0;j<no_of_rows;j++)
                data[j][no_of_columns]=0;
            requered[no_of_columns]=sum_of_cap-sum_of_req;
            no_of_columns++;
        }
        else{
            for(j=0;j<no_of_columns;j++)
                data[no_of_rows][j]=0;
            capacity[no_of_rows]=sum_of_req-sum_of_cap;
            no_of_rows++;
        }
    }
    i=j=0;
    arrayCop(0,no_of_rows,capacity,0,temp_capacity);
    arrayCop(0,no_of_columns,requered,0,temp_requered);
    copy2DArray(0,0,no_of_rows,no_of_columns,data,0,0,temp_data);
    int rowPanalty[]=new int [MAX];;
    int colPanalty[]=new int [MAX];;
    int panaltyData[]=new int [MAX],n=0;
    while(!checkValue(temp_capacity,no_of_rows) || !checkValue(temp_requered,no_of_columns)){

        for(i=0;i<no_of_rows;i++){
            arrayCop(0,no_of_columns,temp_data[i],0,panaltyData);
            if(temp_capacity[i]!=0)
                rowPanalty[i]=getPanalty(panaltyData,no_of_columns);
            else
                rowPanalty[i]=0;
        }
        for(i=0;i<no_of_columns;i++){
            for(j=0;j<no_of_rows;j++)
                panaltyData[j]=temp_data[j][i];
            if(requered[i]!=0)
                colPanalty[i]=getPanalty(panaltyData,no_of_rows);
            else
                colPanalty[i]=0;
        }
        int maxRowPanalty=getMaxVal(rowPanalty,no_of_rows);
        int maxColPanalty=getMaxVal(colPanalty,no_of_columns);
        int maxPanRow[]=new int [MAX];
        int maxPanCol[]=new int [MAX];;
        if(maxRowPanalty>maxColPanalty){
            i=getMaxValPos(rowPanalty,no_of_rows,maxRowPanalty);
            for(j=0;j<no_of_columns;j++)
                maxPanRow[j]=temp_data[i][j];
            min=getMinVal(maxPanRow,no_of_columns);
            j=getMinValsPos(min,maxPanRow,no_of_columns);
        }
        else{
            j=getMaxValPos(colPanalty,no_of_columns,maxColPanalty);
            for(i=0;i<no_of_rows;i++)
                maxPanCol[i]=temp_data[i][j];
            min=getMinVal(maxPanCol,no_of_rows);
            i=getMinValsPos(min,maxPanCol,no_of_rows);
        }

        if(temp_capacity[i]>temp_requered[j]){
            allocation[i][j]=temp_requered[j];
            for(int k=0;k<no_of_rows;k++)
                temp_data[k][j]=9999;
            temp_capacity[i]-=temp_requered[j];
            temp_requered[j]=0;
        }
        else if(temp_capacity[i]<temp_requered[j]){
            allocation[i][j]=temp_capacity[i];
            for(int k=0;k<no_of_columns;k++)
                temp_data[i][k]=9999;
            temp_requered[j]-=temp_capacity[i];
            temp_capacity[i]=0;
        }
        else{
            int k;
            allocation[i][j]=temp_capacity[i];
            for(k=0;k<no_of_rows;k++)
                temp_data[k][j]=9999;
            for(k=0;k<no_of_columns;k++)
                temp_data[i][k]=9999;
            temp_requered[j]=temp_capacity[i]=0;
        }
        n++;
    }
    no_of_allocation=n;
}// end of allocation

int getPanalty(int array[],int no){
    int i,j,temp;
    for(i=0;i<no;i++)
        for(j=i+1;j<no;j++)
            if(array[i]>array[j]){
                temp=array[i];
                array[i]=array[j];
                array[j]=temp;
            }
    return array[1]-array[0];
}
int getMinVal(int array[],int no){
    int min=array[0];
    for(int i=0;i<no;i++)
        if(array[i]<min)
            min=array[i];
    return min;
}
int getMinValsPos(int value,int temp_data[],int no){
    int k=0;
    for(int i=0;i<no;i++)
        if(temp_data[i]==value)
            return i;
    return -1;
}
int getTotalMinVal(int array[],int n,int value){
    int no=0;
    for(int i=0;i<n;i++)
        if(array[i]==value)
                no++;
    return no;
}
boolean checkValue(int arr[],int no){
    for(int i=0;i<no;i++)
        if(arr[i]!=0)
            return false;
    return true;
}
void arrayCop(int start,int end,int array1[],int start1,int array2[]){
    for(int i=start,j=start1;i<end;i++,j++)
        array2[j]=array1[i];
}
int getTotal(int array[],int no){
    int sum=0;
    for(int i=0;i<no;i++)
        sum+=array[i];
    return sum;
}

int getMaxVal(int array[],int no){
    int max=0;
    for(int i=0;i<no;i++)
        if(array[i]>max)
            max=array[i];
    return max;
}
int getMaxValPos(int array[],int no,int value){
    for(int i=0;i<no;i++)
        if(value==array[i])
            return i;
    return -1;
}
int display(int final_supply[][])
{
     int k=0,sum=0;
     
     print("\n");
    for(int i=0;i<no_of_rows;i++){
        for(int j=0;j<no_of_columns;j++){
            if(allocation[i][j]!=0){
                sum+=data[i][j]*allocation[i][j];
                final_supply[i][j]=allocation[i][j];  // coping allocation in final_supply
            }print(final_supply[i][j]+" ");
        }print("\n");
    }
        return sum;
}
  }
