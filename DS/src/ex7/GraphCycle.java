package ex7;

import java.util.ArrayList;
import java.util.Arrays;

public class GraphCycle {
    private int n;// 节点数
    private int[] visited;// 节点状态,值为0的是未访问的
    private int[][] e;// 有向图的邻接矩阵
    private ArrayList<Integer> trace = new ArrayList<Integer>();// 从出发节点到当前节点的轨迹
    private boolean hasCycle = false;

    public GraphCycle(int n, int[][] e) {
        this.n = n;
        visited = new int[n];
        Arrays.fill(visited, 0);
        this.e = e;
    }

    void findCycle(int v) { // 递归DFS深度优先遍历
        //visited[v] = 1说明节点已经访问过
        if (visited[v] == 1) {
            int j;
            //深度优先遍历又访问了访问过的顶点，说明有环
            if ((j = trace.indexOf(v)) != -1) {
                hasCycle = true;
                System.out.print("Cycle:");
                while (j < trace.size()) {
                    System.out.print(trace.get(j) + " ");
                    j++;
                }
                System.out.print(v);
                System.out.print("\n");
                return;
            }
            return;
        }
        //如果visited[v]!=1，说明一开始还未访问，现在把它置为已访问
        visited[v] = 1;
        trace.add(v);//往遍历轨迹中添加v

        //对每一个顶点，如果有边就进行DFS
        for (int i = 0; i < n; i++) {
            if (e[v][i] == 1)
                findCycle(i);
        }
        trace.remove(trace.size() - 1);//所有邻接点都被访问了，回退
    }

    public boolean getHasCycle() {
        return hasCycle;
    }

    public static void main(String[] args) {
        int n = 6;
        int[][] e = {
                { 0, 1, 0, 1, 0, 0},
                { 0, 0, 1, 0, 0, 0},
                { 0, 0, 0, 1, 0, 0},
                { 0, 0, 0, 0, 0, 1},
                { 1, 0, 0, 1, 0, 0},
                { 0, 0, 0, 0, 1, 0 }
        };
        GraphCycle c = new GraphCycle(n, e);
        c.findCycle(0);
        if (!c.hasCycle)
            System.out.println("No Cycle.");
    }
}
