public class ex2 {

    public static void main(String[] args) {

        /**
         * n为盘子的数量
         */
        int n=6;

        hanoi('A','C','B',n);
    }

    /**
     * 移动n个盘子分解成移动n-1到via,移动最底下的盘子，再把n-1放上去
     */
    public static void hanoi(char src,char des,char via,int n){

        if(n==1){

            System.out.println(src + "->" + des);

        }else {

            hanoi(src, via, des, n - 1);
            System.out.println(src + "->" + des);
            hanoi(via, des, src, n - 1);

        }

    }
}
