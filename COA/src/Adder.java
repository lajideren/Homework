public class Adder {


    /**
     * 二进制补码取反加一
     */
    public static String negateBinary(String str) {

        StringBuffer sb = new StringBuffer();

        //取反过程
        for (int i = 0; i < str.length(); i++) {
            char ch = str.charAt(i) == '0' ? '1' : '0';
            sb.append(ch);
        }
        str = sb.toString();

        //加一过程
        sb.setLength(0);
        for (int i = 0; i < str.length(); i++) {
            char ch = i == str.length() - 1 ? '1' : '0';
            sb.append(ch);
        }
        str = SerialCarryAdder(str, sb.toString());

        return str;
    }


    /**
     * 十进制数转化为二进制数
     * len表示位数
     */
    public static String DecimalToBinary(int n, int len) {

        //使用api转换
        String str = Integer.toBinaryString(n);

        //长度不足在左侧增加符号位，长度超过截取
        if (str.length() > len)
            str = str.substring(str.length() - len, str.length());
        else if (str.length() < len) {

            char ch = n >= 0 ? '0' : '1';
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < (len - str.length()); i++) {
                sb.append(ch);
            }
            sb.append(str);
            str = sb.toString();

        }

        return str;

    }

    /**
     * 二进制数转换为十进制
     */
    public static int BinaryToDecimal(String str) {

//        System.out.println(str);

        //是否非负
        boolean flag = str.charAt(0) == '0';

        //如果为负数首先取反加一
        if (!flag) {

            str = negateBinary(str);

        }

//        System.out.println(str);
        int n = 0;
        for (int i = 0; i < str.length(); i++) {
            n = n * 2 + str.charAt(i) - '0';
        }

        n = flag ? n : -n;

        return n;

    }

    /**
     * 串行进位加法器
     */
    public static String SerialCarryAdder(String X, String Y) {

        StringBuffer sb = new StringBuffer();

        int len = X.length();
        int Si, Ci, Ci1;
        Ci1 = 0;
        for (int i = len - 1; i >= 0; i--) {

            //需要char转换为int再进行运算
            int Xi = X.charAt(i) - '0';
            int Yi = Y.charAt(i) - '0';


            Si = Xi ^ Yi ^ Ci1;
            Ci = Xi & Ci1 | Yi & Ci1 | Xi & Yi;

            //===========判断是否溢出  可删除============
            if (i == 0 && Ci != Ci1) {
//                System.out.println("overflow");
            }

            Ci1 = Ci;

            sb.append(Si);
        }

        //========加上最后的进位 可删除========
//        if (Ci1 != 0) {
//            sb.append(Ci1);
//        }

        return sb.reverse().toString();

    }


    /**
     * 用booth算法完成二进制乘法
     * X1是X的取反加一
     */
    public static String mulByBooth(String X, String Y) {

        int len = X.length();
        String X1 = negateBinary(X);

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < len; i++) {
            sb.append(0);
        }
        //初始值为0
        String str = sb.toString();

        Y += '0';//Y0=0


        for (int i = len - 1; i >= 0; i--) {

            int flag = Y.charAt(i + 1) - Y.charAt(i);
            if (flag == 1)
                str = SerialCarryAdder(str, X);
            else if (flag == -1)
                str = SerialCarryAdder(str, X1);

            //累加结果右移一位，符号保持不变
            //X和X1左移一位
//            if (i != 0) {
            str = str.charAt(0) + str;
            X = X + '0';
            X1 = X1 + '0';
//            }

        }

        return str;

    }


    /**
     * 用恢复余数法完成二进制除法
     * Y1是Y的取反加一
     * 返回值是remainder+quotient
     */
    public static String divByRecov(String X, String Y) {

        int len = X.length();
        String Y1 = negateBinary(Y);

        //先将X补长到两倍长
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < len; i++) {
            sb.append(X.charAt(0));
        }
        X = sb.append(X).toString();

        //X,Y符号是否相同
        boolean flag = X.charAt(0) == Y.charAt(0);
        for (int i = 0; i < len; i++) {

            //将X左移一位
            X = X.substring(1, X.length());
            //取出余数部分
            String remainder = X.substring(0, len);

            //若符号相同相减，否则相加
            String temp;
            if (flag)
                temp = SerialCarryAdder(remainder, Y1);
            else
                temp = SerialCarryAdder(remainder, Y);

            //检查是否enough,符号与remainder不同则not enough
            if (temp.charAt(0) == remainder.charAt(0)) {
                X = temp + X.substring(len);
                X += '1';
            } else
                X += '0';

        }

        //X与Y符号不同，将商取反
        if (!flag)
            X = X.substring(0, len) + negateBinary(X.substring(len));

        //返回remainder+quotient
        return X;

    }


    /**
     * 不太理解
     * 只是按照书上说的翻译的代码
     */
    public static String divByNotRecov(String X, String Y) {

        String XX=X;

        int len = X.length();
        String Y1 = negateBinary(Y);

        //先将X补长到两倍长
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < len; i++) {
            sb.append(X.charAt(0));
        }
        X = sb.append(X).toString();

        //=======第一步=======
        String remainder = X.substring(0, len);
        if (X.charAt(0) == Y.charAt(0))
            remainder = SerialCarryAdder(remainder, Y1);
        else
            remainder = SerialCarryAdder(remainder, Y);

        if (remainder.charAt(0) == Y.charAt(0))
            X += '1';
        else
            X += '0';

        X = remainder + X.substring(len);


        //=======第二步=======
        for (int i = 0; i <len; i++) {

            remainder = X.substring(0, len);
            X = X.substring(1);
            String newRemainder;
            if (remainder.charAt(0) == Y.charAt(0))
                newRemainder = SerialCarryAdder(X.substring(0, len), Y1);
            else
                newRemainder = SerialCarryAdder(X.substring(0, len), Y);

            X = newRemainder + X.substring(len);
            if (newRemainder.charAt(0) == Y.charAt(0))
                X += '1';
            else
                X += '0';

        }

        //========最后的处理==================

//        System.out.println(X);

        remainder=X.substring(0, len);
        if(remainder.charAt(0)!=XX.charAt(0)) {
            if (XX.charAt(0) == Y.charAt(0))
                remainder = SerialCarryAdder(remainder, Y);
            else
                remainder = SerialCarryAdder(remainder, Y1);
        }


        String quotient=X.substring(len+1);
        if(XX.charAt(0)!=Y.charAt(0)){
            sb.setLength(0);
            for(int i=0;i<len-1;i++){
                sb.append(0);
            }
            sb.append(1);
            quotient=SerialCarryAdder(quotient,sb.toString());
//            System.out.println(quotient);
        }

        X=remainder+quotient;


        return X;

    }


    /**
     * 做两个二进制数的加法
     */
    public static String add(int X, int Y, int len) {

        String Xs = DecimalToBinary(X, len);
        String Ys = DecimalToBinary(Y, len);
        System.out.println(Xs + " " + Ys);

        return SerialCarryAdder(Xs, Ys);

    }

    /**
     * 若要做减法，先取反第二个数再做加法
     */
    public static String sub(int X, int Y, int len) {

        return add(X, -Y, len);

    }

    public static String mul(int X, int Y, int len) {

        String Xs = DecimalToBinary(X, len);
        String Ys = DecimalToBinary(Y, len);
        System.out.println(Xs + " " + Ys);

        return mulByBooth(Xs, Ys);
    }

    public static String div(int X, int Y, int len) {

        String Xs = DecimalToBinary(X, len);
        String Ys = DecimalToBinary(Y, len);
        System.out.println(Xs + " " + Ys);

        return divByRecov(Xs, Ys);
//        return divByNotRecov(Xs, Ys);
    }


    public static void main(String[] args) {


        int X = -7;
        int Y = 3;
        int len = 4;

        System.out.println(div(X, Y, len));

    }
}
