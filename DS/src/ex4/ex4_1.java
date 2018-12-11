package ex4;

import java.util.Scanner;


/**
 * 使用数组解决约瑟夫
 * 从键盘读入n和m
 */
public class ex4_1 {

    public static void main(String[] args) {

        Scanner scan=new Scanner(System.in);
        int n=scan.nextInt();
        int m=scan.nextInt();

        boolean[] alive=new boolean[n];
        for(int i=0;i<n;i++){
            alive[i]=true;
        }

        int p=-1;//指针

        //循环m-1次，每次出列1人
        for(int i=0;i<n;i++){

            int step=0;//记录指针移动的步数
            while(step<m) {
                p=(p+1)%n;

                if (alive[p]) {
                    step++;
                }

            }
            alive[p]=false;
            System.out.print((p+1)+" ");

        }
    }
}
