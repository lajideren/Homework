import java.util.List;
import java.util.Scanner;


/**
 * 从最后一个数开始分成取出一个数(求剩余的数的r-1组合)或者不取出
 * 从键盘读入n和r
 */

public class ex1 {

    private static int[] nums;


    private static void comb(int n,int r){

        if(r>0){
            for(int i=n;i>=r;i--){
                nums[r-1]=i;
                comb(i-1,r-1);
            }
        }else {
            for(int i=nums.length-1;i>=0;i--){
                System.out.print(nums[i]+" ");
            }
            System.out.println();
        }

    }

    public static void main(String[] args) {

        Scanner scan=new Scanner(System.in);
        int n=scan.nextInt();
        int r=scan.nextInt();

        nums=new int[r];

        comb(n,r);
    }


}
