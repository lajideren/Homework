package exam2;

public class NBCD {

    public static String NBCDRresentation(String num) {

        String sign;

        if (num.charAt(0) == '-') {
            num = num.substring(1);
            sign = "1101";
        } else {
            sign = "1100";
        }

        int len = num.length();

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < len; i++) {
            int temp = num.charAt(i) - '0';
            sb.append(IntegerToBinary(temp, 4));
        }

        return sign + sb.toString();

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

    public static String NBCDTrueValue(String num) {

        String sign = num.substring(0, 4);
        num = num.substring(4);

        int len = num.length() / 4;

        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < len; i++) {
            String temp = num.substring(i * 4, (i + 1) * 4);
            sb.append(BinaryToInteger(temp));
        }

        String res = sb.toString();
        if (sign.equals("1101")) {
            res = "-" + res;
        }

        return res;


    }

    public static int BinaryToInteger(String str) {

        int num = 0;
        for (int i = 0; i < str.length(); i++) {
            num = num * 2 + str.charAt(i) - '0';
        }

        return num;
    }

    public static String NBCDComplement(String num) {

        int len = num.length() / 4;

        StringBuffer sb = new StringBuffer();
        for (int i = len - 1; i >= 0; i--) {

            String temp = num.substring(i * 4, (i + 1) * 4);
            temp = negation(temp);
            temp = serialCarryAdder(temp, "1010").substring(1);
            sb.insert(0, temp);

        }

        String res = sb.toString();
        res = serialCarryAdder(res, IntegerToBinary(1, res.length())).substring(1);

        return res;

    }




    public static String NBCDAddition(String operand1, String operand2) {


        String sign1 = operand1.substring(0, 4);
        String sign2 = operand2.substring(0, 4);

        String num1 = operand1.substring(4);
        String num2 = operand2.substring(4);

        int len = num1.length() / 4;

        if (!sign1.equals(sign2)) {
            num2 = NBCDComplement(num2);
        }

        int C = 0;
        StringBuffer sb = new StringBuffer();
        for (int i = len - 1; i >= 0; i--) {

            String temp1 = num1.substring(i * 4, (i + 1) * 4);
            String temp2 = num2.substring(i * 4, (i + 1) * 4);

            //因为一个位最大为9，加上1也无法直接产生进位，所以先加到temp1上
            if (C == 1) {
                temp1 = serialCarryAdder(temp1, "0001").substring(1);
            }

            String temp = serialCarryAdder(temp1, temp2);
            char carry = temp.charAt(0);
            temp = temp.substring(1);
            if (carry == '1') {
                C = 1;
                temp = serialCarryAdder(temp, "0110").substring(1);
            } else if (temp.charAt(0) == '1' && temp.charAt(1) == '1' || temp.charAt(0) == '1' && temp.charAt(2) == '1') {
                C = 1;
                temp = serialCarryAdder(temp, "0110").substring(1);
            } else {
                C = 0;
            }

            sb.insert(0, temp);

        }

        String sign = sign1;
        String num = sb.toString();

        if (!sign1.equals(sign2)) {

            if (C != 1) {
                sign = sign2;
                num = NBCDComplement(num);
            }

        } else {

            if (C == 1) {
                num = "0001" + num;
            }

        }

        return sign + num;


    }


    public static void printlnNBCD(String num) {

        for (int i = 0; i < num.length(); i++) {
            if (i > 0 && i % 4 == 0)
                System.out.print(" ");
            System.out.print(num.charAt(i));
        }

        System.out.println();
    }


    public static void main(String[] args) {

        String op1 = NBCDRresentation("234");
        printlnNBCD(op1);
        String op2 = NBCDRresentation("888");
        printlnNBCD(op2);

        String res = NBCDAddition(op1, op2);
        printlnNBCD(res);
        String val = NBCDTrueValue(res);
        System.out.println(val);
//        str=NBCDComplement(str);

//        System.out.println(str);
    }

    /**
     * 串行进位加法器，必须使用到fullAdder方法
     * 返回的String长度是len+1
     */
    public static String serialCarryAdder(String x, String y) {


        char xi, yi, ci, ci1, si;
        ci1 = '0';

        StringBuffer sb = new StringBuffer();
        int len = x.length();
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
