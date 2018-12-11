public class NBCD {


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
        str = SerialCarryAdder(str, sb.toString(), false);

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
    public static String SerialCarryAdder(String X, String Y, boolean carry) {

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
//            if (i == 0 && Ci != Ci1) {
//                System.out.println("overflow");
//            }

            Ci1 = Ci;

            sb.append(Si);
        }

        //========加上最后的进位 可删除========
        if (carry && Ci1 != 0) {
            sb.append(Ci1);
        }

        return sb.reverse().toString();

    }


    public static String toNBCDString(int n) {

        StringBuffer sb = new StringBuffer();

        String str = Integer.toString(n);

        String res;

        if (n >= 0) {
            for (int i = 0; i < str.length(); i++) {
                sb.append(DecimalToBinary(str.charAt(i) - '0', 4));
            }
            res = sb.toString();
        } else {

            str = str.substring(1);//截掉符号

            for (int i = 0; i < str.length(); i++) {
                sb.append(DecimalToBinary(str.charAt(i) - '0', 4));
            }
            res = sb.toString();

            res = negateNBCD(res);

        }

        return res;

    }

    /**
     * NBCD码取反加一
     */
    public static String negateNBCD(String str) {

        StringBuffer sb = new StringBuffer();

        //如果为负数，首先每位取反，然后加上"1010"
        for (int i = 0; i < str.length() / 4; i++) {


            String temp = str.substring(i * 4, (i + 1) * 4);

            StringBuffer sb_temp = new StringBuffer();
            for (int k = 0; k < 4; k++) {
                sb_temp.append(temp.charAt(k) == '0' ? '1' : '0');
            }

            temp = SerialCarryAdder(sb_temp.toString(), "1010", false);
            sb.append(temp);

        }

        //最后加上1
        String res = sb.toString();
        sb.setLength(0);
        for (int i = 0; i < res.length(); i++) {
            if (i != res.length() - 1)
                sb.append('0');
            else
                sb.append('1');
        }

        res = SerialCarryAdder(res, sb.toString(),false);

        return res;
    }




    /**
     * NBCD码的加法,包括最后的进位
     */
    public static String addNBCD(String Xs, String Ys) {


        int len = Xs.length() / 4;

        StringBuffer sb = new StringBuffer();

        int C = 0;//表示进位
        for (int i = len - 1; i >= 0; i--) {

            String s1 = Xs.substring(i * 4, (i + 1) * 4);
            String s2 = Ys.substring(i * 4, (i + 1) * 4);

            //如果有进位先加一
            if (C == 1)
                s1 = SerialCarryAdder(s1, "0001", true);

            //两个位相加
            String s = SerialCarryAdder(s1, s2, true);

            //如果没有产生进位
            if (s.length() == 4) {

                //如果这个数大于等于10，加上0110可以产生进位
                if (s.charAt(0) == '1' && s.charAt(1) == '1' || s.charAt(0) == '1' && s.charAt(2) == '1') {
                    C = 1;
                    s = SerialCarryAdder(s, "0110", true);
                    s = s.substring(1);
                } else {
                    C = 0;
                }

            } else {//若长度大于4则产生了进位,设置进位，并加上6

                C = 1;
                s = s.substring(1);
                s = SerialCarryAdder(s, "0110", true);


            }

            sb.insert(0, s);


        }

        if (C == 1)
            sb.insert(0, "0001");

        return sb.toString();


    }

    public static void printlnNBCD(String str) {


        for (int i = 0; i < str.length(); i++) {
            if (i != 0 && i % 4 == 0) {
                System.out.print(" ");
            }
            System.out.print(str.charAt(i));
        }

        System.out.println();
    }


    public static String add(int X, int Y) {

        String Xs = toNBCDString(X);
        String Ys = toNBCDString(Y);

        printlnNBCD(Xs);
        printlnNBCD(Ys);
        System.out.println("--------------");
        String res = addNBCD(Xs, Ys);

        //如果做减法最后没有进位需要取反加一
        if (Y < 0) {
            if (res.length() > Ys.length()) {
                res = res.substring(4);
            } else {
                res = negateNBCD(res);
            }
        }

        return res;

    }


    public static void main(String[] args) {

        printlnNBCD(add(234,567));
        System.out.println();
        printlnNBCD(add(897,969));
        System.out.println();
        printlnNBCD(add(673,-320));
        System.out.println();
        printlnNBCD(add(178,-859));
        System.out.println();
    }
}
