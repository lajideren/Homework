package ex3;

import java.util.Scanner;

public class ex3 {


    //1 0 2 8 3 14 2 100 0 0
    //-1 1 10 6 -3 10 8 14 -2 100 0 0

    /**
     * 从键盘读入两组整数对以0 0结尾
     * 例如读入一组1 0 2 8 3 14 2 100 0 0 回车再读入一组-1 1 10 6 -3 10 8 14 -2 100 0 0
     */

    public static void main(String[] args) {

        Node head1=createPoly();
        Node head2=createPoly();
        Node head=addPoly(head1,head2);

        printPoly(head1);
        printPoly(head2);
        printPoly(head);




    }

    private static Node addPoly(Node head1,Node head2){

        Node p1=head1;
        Node p2=head2;

        Node head=new Node(-1,-1);//创建一个头结点随意取值
        Node p=head;

        while(p1!=null&&p2!=null){

            if(p1.expn<p2.expn){
                p.next= new Node(p1.coef,p1.expn);
                p1=p1.next;
            }else if(p1.expn>p2.expn){
                p.next= new Node(p2.coef,p2.expn);
                p2=p2.next;
            }else {
                p.next=new Node(p1.coef+p2.coef,p1.expn);
                p1=p1.next;
                p2=p2.next;
            }

            p=p.next;
        }

        while(p1!=null){
            p.next= new Node(p1.coef,p1.expn);
            p1=p1.next;
            p=p.next;
        }

        while(p2!=null){
            p.next= new Node(p2.coef,p2.expn);
            p2=p2.next;
            p=p.next;
        }

        head=head.next;
        return head;


    }

    /**
     * 读入整数对 到0 0为止
     * @return 头结点
     */
    private static Node createPoly(){

        Scanner scan=new Scanner(System.in);


        //创建头结点
        int coef=scan.nextInt();//系数
        int expn=scan.nextInt();//指数
        Node head=new Node(coef,expn);
        Node cur=head;


        coef=scan.nextInt();
        expn=scan.nextInt();

        while(coef!=0||expn!=0){

            cur.next=new Node(coef,expn);
            cur=cur.next;
            coef=scan.nextInt();//系数
            expn=scan.nextInt();//指数

        }

        return head;


    }

    private static void printPoly(Node head){

        int coef,expn;


        System.out.print(head.coef);
        if(head.expn!=0){
            System.out.print("X^"+head.expn);
        }

        Node cur=head.next;

        while(cur!=null){

            if(cur.coef!=0) {

                if (cur.coef > 0) {
                    System.out.print("+" + cur.coef);
                } else if (cur.coef < 0) {
                    System.out.print("+(" + cur.coef + ")");
                }

                if (cur.expn != 0) {
                    System.out.print("X^" + cur.expn);
                }
            }

            cur=cur.next;
        }

        System.out.println();
    }







}
