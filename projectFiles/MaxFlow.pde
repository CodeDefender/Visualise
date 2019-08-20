import java.util.*;
import java.lang.*;
import java.io.*;
import java.util.LinkedList;
public class MaxFlow
{
  //static final int V=6;
  boolean bfs(int rGraph[][],int s,int t,int parent[],int V)
  {
    boolean visited[] = new boolean[V];
    for(int i=0;i<V;i++)
        visited[i]=false;
        
     LinkedList<Integer> queue = new LinkedList<Integer>();
     queue.add(s);
     visited[s]=true;
     parent[s]=-1;
     
     while(queue.size()!=0)
     {
       int u = queue.poll();
       for(int v=0;v<V;v++)
       {
         if(visited[v]==false && rGraph[u][v]>0)
         {
           queue.add(v);
           parent[v]=u;
           visited[v]=true;
         }
       }
     }
    
      return (visited[t] == true);
  }
  
  int fordFulkerson(int grph[][],int s,int t,int V)
  {
    int u,v;
    int rGraph[][]=new int[V][V];
    for(u=0;u<V;u++)
       for(v=0;v<V;v++)
         rGraph[u][v]=grph[u][v];
     int parent[]=new int[V];
     int max_flow=0;
        
     while(bfs(rGraph,s,t,parent,V))
     {
     
       int path_flow= Integer.MAX_VALUE;
       for(v=t;v!=s;v=parent[v])
       {
         u=parent[v];
         path_flow= Math.min(path_flow,rGraph[u][v]);
       }
     
       for(v=t;v!=s;v=parent[v])
       {
         u=parent[v];
         rGraph[u][v]-=path_flow;
         rGraph[v][u]+=path_flow;
       }
       max_flow+=path_flow;
     }
     
     for(u=0;u<V;u++)
       {for(v=0;v<V;v++)
        { grph[u][v]-=rGraph[u][v];
         // ans_graph[u][v] = grph[u][v];
          print(" "+grph[u][v]);
        }print("\n");
       }
     return max_flow;
  }
}
  
