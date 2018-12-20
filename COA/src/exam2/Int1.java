package exam2;

public class Int1 {

    public static String divByNotRec(String operand1,String operand2){

        int len=operand1.length();

        String remainer=operand1;
        String y=operand2;
        String y1=complement(y);
        for(int i=0;i<len;i++){
            remainer=remainer.charAt(0)+remainer;
            y=y+'0';
            y1=y1+'0';
        }

        if(isSameSign(remainer,y)){
            remainer=serialCarryAdder(remainer,y1).substring(1);
        }else {
            remainer=serialCarryAdder(remainer,y).substring(1);
        }

        StringBuffer sb=new StringBuffer();

        for(int i=0;i<len;i++){

            if(isSameSign(remainer,y)){
                sb.append(1);
                remainer=remainer.substring(1);
                y=y.substring(0,y.length()-1);
                y1=y1.substring(0,y1.length()-1);
                remainer=serialCarryAdder(remainer,y1).substring(1);
            }else {
                sb.append(0);
                remainer=remainer.substring(1);
                y=y.substring(0,y.length()-1);
                y1=y1.substring(0,y1.length()-1);
                remainer=serialCarryAdder(remainer,y).substring(1);
            }

        }

        if(isSameSign(remainer,y)){
            sb.append(1);
        }else {
            sb.append(0);
        }

        String quotient=sb.toString();
        quotient=quotient.substring(1);
        if(quotient.charAt(0)=='1'){
            quotient=serialCarryAdder(quotient,IntegerToBinary(1,len)).substring(1);
        }

        if(!isSameSign(remainer,operand1)){
            if(isSameSign(remainer,y)){
                remainer=serialCarryAdder(remainer,y1).substring(1);
            }else{
                remainer=serialCarryAdder(remainer,y).substring(1);
            }
        }

        return remainer+quotient;

    }


    public static String divByRec(String operand1,String operand2){

        int len=operand1.length();

        String x=operand1;
        String y=operand2;
        if(isSameSign(operand1,operand2)){
            y=complement(y);
        }

        for(int i=0;i<len;i++){
            x=x.charAt(0)+x;
            y=y+'0';
        }

        StringBuffer sb=new StringBuffer();

        for(int i=0;i<len;i++){

            x=x.substring(1);
            y=y.substring(0,y.length()-1);

            String temp=serialCarryAdder(x,y).substring(1);
            if(isSameSign(x,temp)){
                x=temp;
                sb.append(1);
            }else {
                sb.append(0);
            }

        }

        String remainder=x;
        String quotient=sb.toString();
        if(!isSameSign(operand1,operand2)){
            quotient=complement(quotient);
        }

        System.out.println(remainder+" "+quotient);

        return remainder+quotient;



    }



    public static void main(String[] args) {
//        System.out.println(complement("1001010001"));

//        System.out.println(mulByBooth("1001","1010"));
//        System.out.println(divByRec("1001", "0011"));

        System.out.println(divByRec("10011","00101"));
    }

    public static boolean isSameSign(String op1,String op2){

        return op1.charAt(0)==op2.charAt(0);
    }


    public static String IntegerToBinary(int num, int len) {

        String str = Integer.toBinaryString(num);
        StringBuffer sb = new StringBuffer();
        sb.append(str);
        for (int i = 0; i < len - str.length(); i++) {
            sb.insert(0, 0);
        }
        return sb.toString();

    }

    public static String complement(String num) {

        return serialCarryAdder(negation(num), IntegerToBinary(1, num.length())).substring(1);

    }

    public static String serialCarryAdder(String x, String y) {

        int len = x.length();

        char xi, yi, ci, ci1, si;
        ci1 = '0';

        StringBuffer sb = new StringBuffer();

        for (int i = len - 1; i >= 0; i--) {

            xi = x.charAt(i);
            yi = y.charAt(i);

            char[] res = fullAdder(xi, yi, ci1);
            si = res[0];
            ci = res[1];

            sb.insert(0, si);
            ci1 = ci;

        }

        sb.insert(0, ci1);

        return sb.toString();

    }


    /**
     * 逻辑左移
     */
    public static String leftShift(String str, int n) {

        for (int i = 0; i < n; i++) {

            str = str.substring(1) + '0';

        }

        return str;

    }

    /**
     * 逻辑右移，左边补0
     */
    public static String logicalRightShift(String str, int n) {

        for (int i = 0; i < n; i++) {

            str = '0' + str.substring(0, str.length() - 1);

        }

        return str;
    }

    /**
     * 算术右移，左边补符号位
     */
    public static String rightShift(String str, int n) {

        for (int i = 0; i < n; i++) {

            str = str.charAt(0) + str.substring(0, str.length() - 1);

        }

        return str;
    }


    /**
     * 按位取反(给出的方法没有加1，需要用串行进位加法器加1）
     */
    public static String negation(String str) {

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < str.length(); i++) {

            sb.append(str.charAt(i) == '1' ? '0' : '1');

        }

        return sb.toString();

    }


    /**
     * 全加器
     * 返回一个char[]数组，第1个是si,第2个是ci
     **/
    public static char[] fullAdder(char x, char y, char c) {

        int xi = x - '0';
        int yi = y - '0';
        int ci1 = c - '0';

        int si = xi ^ yi ^ ci1;
        int ci = xi & ci1 | yi & ci1 | xi & yi;

        char[] res = new char[2];
        res[0] = (char) (si + '0');
        res[1] = (char) (ci + '0');

        return res;

    }


}
