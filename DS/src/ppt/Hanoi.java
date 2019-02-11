package ppt;

public class Hanoi {

    public static void move(char from,char to,char aux,int n){

        if(n==1){
            System.out.println(from+"->"+to);
        }else {
            move(from,aux,to,n-1);
            System.out.println(from+"->"+to);
            move(aux,to,from,n-1);
        }

    }

    public static void main(String[] args) {
        move('A','C','B',3);
    }


}
