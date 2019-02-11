package ppt;

public class test {

    public static int countOnt(int n) {
        if (n == 0)
            return 0;

        return countOnt(n / 2) + n % 2;
    }

    public static int findMax(int[] A, int n) {

        if(n==1)
            return A[0];

        int temp = findMax(A, n - 1);
        return A[n - 1] > temp ? A[n - 1] : temp;

    }

    public static double average(int[] A,int n){

        if(n==1)
            return (double)A[0];

        return (A[n-1]+average(A,n-1)*(n-1))/n;
    }

    public static void main(String[] args) {

        int[] A={1,3,2,9,482,1924,7,3};
        System.out.println(average(A,A.length));
    }
}
