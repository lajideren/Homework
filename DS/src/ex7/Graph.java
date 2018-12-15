package ex7;

import java.io.*;
import java.util.*;

public class Graph {

    private int vertexNum;
    private boolean[] visited;
    private int[][] edge;
    private List<Integer> vertex;
    private List<Integer> path;

    public Graph(boolean[] visited, int[][] edge, List<Integer> vertex) {
        this.visited = visited;
        this.edge = edge;
        this.vertex = vertex;
        this.vertexNum = vertex.size();
        this.path = new ArrayList<>();
    }

    public void DFS(int v, List<String> cycle) {

        if (path.indexOf(vertex.get(v)) == -1) {
            visited[v] = true;
            path.add(vertex.get(v));
            for (int i = 0; i < vertexNum; i++) {
                if (edge[v][i] == 1) {
                    DFS(i, cycle);
                }
            }
            path.remove(path.size() - 1);
        } else {
            StringBuffer sb = new StringBuffer();
            for (int i = path.indexOf(vertex.get(v)); i < path.size(); i++) {
                sb.append(path.get(i));
                if (i != path.size() - 1)
                    sb.append("->");
            }
            cycle.add(sb.toString());
        }

    }


    public static Graph createGragh(String fileName) {

        //存放所有边
        List<Integer> edgeList = new ArrayList<>();
        //存放所有节点
        List<Integer> vertexList = new ArrayList<>();

        try {

            //读入边的数据
            BufferedReader br = new BufferedReader(new FileReader(fileName));
            String temp;

            while ((temp = br.readLine()) != null) {

                String[] strs = temp.split(",");
                int head = Integer.parseInt(strs[0]);
                int tail = Integer.parseInt(strs[1]);

                edgeList.add(head);
                edgeList.add(tail);

                //加入列表中不存在新的节点
                if (vertexList.indexOf(head) == -1)
                    vertexList.add(head);
                if (vertexList.indexOf(tail) == -1)
                    vertexList.add(tail);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        int vertexNum = vertexList.size();

        boolean[] visited = new boolean[vertexNum];
        Arrays.fill(visited, false);

        int[][] edge = new int[vertexNum][vertexNum];
        for (int i = 0; i < vertexNum; i++)
            Arrays.fill(edge[i], -1);

        for (int i = 0; i < edgeList.size(); i++) {
            int head = edgeList.get(i);
            i++;
            int tail = edgeList.get(i);
            edge[vertexList.indexOf(head)][vertexList.indexOf(tail)] = 1;
        }


        return new Graph(visited, edge, vertexList);


    }


    public static void main(String[] args) {

        Graph g = createGragh("src/ex7/edges2.txt");
        List<String> cycles = new ArrayList<>();
        g.DFS(0, cycles);

        if (cycles.size() == 0) {
            System.out.println("No");
        } else {

            System.out.println("Yes");
            System.out.println("-----------------");
            for (int i = 0; i < cycles.size(); i++) {
                System.out.println(cycles.get(i));
            }

        }


    }


}
