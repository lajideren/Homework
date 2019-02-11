package ppt;

import java.util.Scanner;

public class Combination {

    private static int[] num;

    public static void combine(int n, int r) {

        for (int i = n; i >= r; i--) {
            num[r - 1] = i;
            if (r > 1) {
                combine(i - 1, r - 1);
            } else {
                for (int k = num.length - 1; k >= 0; k--) {
                    System.out.print(num[k] + " ");
                }
                System.out.println();
            }
        }

    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int r = sc.nextInt();
        num = new int[r];

        combine(n, r);
    }
}
