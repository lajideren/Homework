package ex7;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Main {

    static int vertexNum;
    static boolean[] visited;
    static int[][] edge;
    static List<Integer> vertex;
    static List<Integer> path;

    public static void DFS(int v, List<List<Integer>> cycle) {

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
            List<Integer> list=new ArrayList<>();
            for (int i = path.indexOf(vertex.get(v)); i < path.size(); i++) {
                list.add(path.get(i));
            }

            //调整顺序
            int min=Integer.MAX_VALUE;
            int minp=0;
            for(int i=0;i<list.size();i++){
                if(list.get(i)<min){
                    min=list.get(i);
                    minp=i;
                }
            }
            List<Integer> temp=new ArrayList<>();
            for(int i=0;i<list.size();i++){
                temp.add(list.get((minp+i)%list.size()));
            }
            list=temp;

//            System.out.println(list);

            boolean isIn=false;
            for(int i=0;i<cycle.size();i++){
                if(cycle.get(i).equals(list))
                    isIn=true;
            }

            if(!isIn) {
                for (int i = 0; i < cycle.size(); i++) {
                    if (list.size() < cycle.get(i).size()) {
                        cycle.add(i, list);
                        return;
                    }
                }
                cycle.add(list);
            }


        }

    }



    public static void createGragh() throws FileNotFoundException {

        //存放所有边
        List<Integer> edgeList = new ArrayList<>();
        //存放所有节点
        List<Integer> vertexList = new ArrayList<>();

//        try {

        //读入边的数据
//        Scanner sc=new Scanner(new File(FileName));
        Scanner sc = new Scanner(System.in);
        String temp;

        while (sc.hasNext()) {

            temp=sc.nextLine();

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

        sc.close();

//        } catch (IOException e) {
//            e.printStackTrace();
//        }



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

        Main.visited=visited;
        Main.edge=edge;
        Main.vertex=vertexList;
        Main.vertexNum=vertexList.size();
        Main.path=new ArrayList<>();


    }

    public static void printCycles(List<List<Integer>> cycles){

        if(cycles.size()==0){
            System.out.print(0);
        }else {
            System.out.println(1);
            System.out.print(cycles.size());
            for(int i=0;i<cycles.size();i++){

                System.out.println();
                List<Integer> list=cycles.get(i);
                for(int k=0;k<list.size();k++){
                    System.out.print(list.get(k));
                    if(k!=list.size()-1)
                        System.out.print(" ");
                }

            }
        }

    }

    public static void main(String[] args) throws FileNotFoundException {


//        createGragh("src/ex7/edges.txt");
        createGragh();
        List<List<Integer>> cycles = new ArrayList<>();
        DFS(0,cycles);
        printCycles(cycles);



    }



}