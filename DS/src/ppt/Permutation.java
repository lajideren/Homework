package ppt;

public class Permutation {

    public static void permute(String str){
        permute(str.toCharArray(),0,str.length()-1);
    }

    private static void permute(char[] str,int low,int high){

        if(low<high){
            for(int i=low;i<=high;i++){
                swap(str,low,i);
                permute(str,low+1,high);
                swap(str,low,i);
            }
        }else {
            for(int i=0;i<=high;i++){
                System.out.print(str[i]);
            }
            System.out.println();
        }

    }

    private static void swap(char[] str,int a,int b){

        char temp=str[a];
        str[a]=str[b];
        str[b]=temp;

    }

    public static void main(String[] args) {
        permute("abc");
    }


}
