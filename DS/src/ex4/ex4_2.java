package ex4;

import java.util.Scanner;

public class ex4_2 {

    /**
     * 返回末尾结点
     */
    private static Node createList(int n){

        Node head=new Node();
        Node p=head;
        for(int i=0;i<n;i++){
            Node temp=new Node();
            temp.num=i+1;
            p.next=temp;
            p=p.next;
        }

        head=head.next;
        p.next=head;

        return head;

    }



    public static void main(String[] args) {
        Scanner scan=new Scanner(System.in);
        int n=scan.nextInt();
        int m=scan.nextInt();

        Node p=createList(n);

        for(int i=0;i<n;i++){

            int step=0;
            while(step<(m-1)){//删除结点相当于走了一步
                p=p.next;
                step++;
            }

            //单链表的删除结点
            System.out.print(p.num+" ");
            p.num=p.next.num;
            p.next=p.next.next;

        }
    }
}
