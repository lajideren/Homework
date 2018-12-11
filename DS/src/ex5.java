import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;
import java.util.Stack;

public class ex5 {

    private static Stack<Character> opStack=new Stack<>();
    private static Stack<Double> numStack=new Stack<>();
    private static int p=0;//指针
    private static char[] arr;

    private static void postfix(char[] arr){

        //先放入一个最低优先级运算符
        opStack.push('#');

        while(p<arr.length) {

            char ch = arr[p];
            if (isDigit(ch)) {

                getNum();

            } else if (ch == ')') {

                while (opStack.peek() != '(') {

                    compute();

                }
                opStack.pop();//将'('出栈

            } else if (ch == '('){
                opStack.push(ch);
            }else if(ch=='#'){

                //全部出栈
                while(opStack.peek()!='#'){
                    compute();
                }
            }else{

                //将栈内优先级高的全部出栈
                while (getPriority(opStack.peek())>=getPriority(ch)) {
                    compute();
                }

                opStack.push(ch);

            }

            p++;

        }


        System.out.println();
        System.out.print(numStack.pop());



    }

    /**
     * 打印运算符,做运算并压栈
     */
    private static double compute(){

        char op=opStack.pop();
        System.out.print(op+" ");

        double num2=numStack.pop();
        double num1=numStack.pop();

        double num;

        switch (op){
            case '+':
                num=num1+num2;
                break;
            case '-':
                num=num1-num2;
                break;
            case '*':
                num=num1*num2;
                break;
            case '/':
                num=num1/num2;
                break;
            default:
                return 0;
        }

        numStack.push(num);
        return num;
    }

    /**
     * 读取数字, 打印并且压栈
     */
    public static double getNum(){

        StringBuilder sb=new StringBuilder();
        while(isDigit(arr[p])||arr[p]=='.'){
            sb.append(arr[p]);
            p++;
        }

        p--;//回退一个字符
        double num=Double.parseDouble(sb.toString());
        System.out.print(num+" ");
        numStack.push(num);
        return num;

    }


    private static boolean isDigit(char ch){
        return 48<=ch&&ch<=57;
    }

    private static int getPriority(char op){

        switch (op){
            case '+':
            case '-':
                return 1;
            case '*':
            case '/':
                return 2;
            default:
                return 0;
        }
    }

    /**
     * 读入中缀表达式以#结尾
     * 12.7-2*(72.2+4*(2.2+2.8))/2+100#
     */

    public static void main(String[] args) {

        BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
        try {
            arr=br.readLine().toCharArray();
            postfix(arr);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
