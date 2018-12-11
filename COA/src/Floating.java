public class Floating {


    public static void printlnFloat(String str) {

        for (int i = 0; i < str.length(); i++) {
            System.out.print(str.charAt(i));
            if (i == 0 || i == 8 || i == 11 || i == 15 || i == 19 || i == 23 || i == 27)
                System.out.print(" ");
        }
        System.out.println();
    }

    public static String floatToBinary(float f) {

        //flag记录f是否非负
        boolean flag = f >= 0;
        if (!flag) f = -f;

        //a表示f的整数部分，b表示f的小数部分
        int a = (int) f;
        float b = f - (int) f;
//        System.out.println(b);

        StringBuffer sb = new StringBuffer();

        //转换整数部分为二进制
        while (a != 0) {
            sb.append(a % 2);
            a = a / 2;
        }
        String as = sb.reverse().toString();

        //转换小数部分为二进制
        sb.setLength(0);
        while (b != 0) {
            sb.append(b * 2 >= 1 ? '1' : '0');
            b = b * 2 - (int) (b * 2);
        }
        String bs = sb.toString();

        //计算指数
        int exp;

        //若整数部分不为0,小数点左移len-1位
        if (as.length() > 0) {

            exp = as.length() - 1;

            //若整数部分为0,而小数部分不为0,找到一个1的位置
        } else if (bs.length() > 0) {

            exp = -(bs.indexOf('1') + 1);

            //若都为0，特殊
        } else {
            exp = 0;
            sb.setLength(0);
            for (int i = 0; i < 32; i++)
                sb.append('0');
            return sb.toString();
        }

        //插入小数点
        sb.setLength(0);
        sb.append(as);
        sb.append(bs);
//        System.out.println(bs);
        sb.insert(sb.indexOf("1") + 1, ".");

        //取得尾数部分,补到23位
        String s = sb.toString();
        String frac = s.substring(s.indexOf('.') + 1);
        //取最多23位
//        frac=frac.substring(0,23);
        sb.setLength(0);
        sb.append(frac);
        for (int i = 0; i < 23 - frac.length(); i++) {
            sb.append('0');
        }
        frac = sb.toString();

        //获得符号位
        String sign = flag ? "0" : "1";

        //获得指数部分，补到8位
        String exps = Integer.toBinaryString(exp + 127);//加上127的bias
        sb.setLength(0);
        sb.append(exps);
        for (int i = 0; i < 8 - exps.length(); i++) {
            sb.insert(0, '0');
        }
        exps = sb.toString();


        System.out.println(as + "." + bs + " " + exp);

//        System.out.println(sign + " " + exps + " " + frac);
        return sign + exps + frac;

    }


    public static int BinaryToInteger(String str) {

        int num = 0;
        for (int i = 0; i < str.length(); i++)
            num = num * 2 + str.charAt(i) - '0';
        return num;

    }

    public static boolean isZero(String str) {

        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == '1')
                return false;
        }

        return true;

    }

    public static String negateBinary(String str) {

        StringBuffer sbX = new StringBuffer();
        StringBuffer sbY = new StringBuffer();

        for (int i = 0; i < str.length(); i++) {
            sbX.append(str.charAt(i) == '0' ? '1' : '0');
            if (i != str.length() - 1)
                sbY.append(0);
            else
                sbY.append(1);
        }

        String res = serialCarryAdder(sbX.toString(), sbY.toString(), false);

        return res;

    }

    public static String serialCarryAdder(String X, String Y, boolean carry) {

        int Xi, Yi, Ci, Ci1, Si;
        Ci1 = 0;

        StringBuffer sb = new StringBuffer();

        for (int i = X.length() - 1; i >= 0; i--) {

            Xi = X.charAt(i) - '0';
            Yi = Y.charAt(i) - '0';


            Si = Xi ^ Yi ^ Ci1;
            Ci = Xi & Ci1 | Yi & Ci1 | Xi & Yi;

            Ci1 = Ci;

            sb.append(Si);

        }

        if (carry && Ci1 == 1) {
            sb.append(1);
        }

        return sb.reverse().toString();


    }

    /**
     * 做两个非0数的加法
     */
    public static String addFloat(String X, String Y) {


        String expsX = X.substring(1, 9);
        String expsY = Y.substring(1, 9);

        int expX = BinaryToInteger(expsX);
        int expY = BinaryToInteger(expsY);

        //指数差值，是之后尾数移位的次数
        int expDif;
        if (expX > expY) {
            String temp = Y;
            Y = X;
            X = temp;
            expDif = expX - expY;
        } else {
            expDif = expY - expX;
        }

        String signX = X.substring(0, 1);
        String signY = Y.substring(0, 1);
        expsX = X.substring(1, 9);
        expsY = Y.substring(1, 9);
        String fracX = "1" + X.substring(9);
        String fracY = "1" + Y.substring(9);

        //右移尾数,增加指数的过程
        for (int i = 0; i < expDif; i++) {

            //右移尾数
            fracX = "0" + fracX.substring(0, fracX.length() - 1);
            //判断尾数是否下溢,如果下溢返回Y
            if (isZero(fracX))
                return Y;

        }

        String sign;
        String exps = expsY;
        String frac;

        //带符号尾数相加过程
        //符号不同，先取补码
        if (!signX.equals(signY)) {
            fracY = negateBinary(fracY);
            frac = serialCarryAdder(fracX, fracY, true);

            //没有进位需要取反
            if (frac.length() > fracX.length()) {
                frac = frac.substring(1);
                sign = "0";
            } else {
                frac = negateBinary(frac);
                sign = "1";
            }


        } else {

            frac = serialCarryAdder(fracX, fracY, true);
            //有进位溢出,则右移尾数
            if (frac.length() > fracX.length()) {

                frac = frac.substring(0, frac.length() - 1);

                //判断指数是否上溢
                if (BinaryToInteger(exps) == 254) {
                    System.out.println("exponent overflow");
                    return null;
                }
                exps = serialCarryAdder(exps, "00000001", false);


            }

            sign = "0";

        }

        if (isZero(frac)) {
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < 32; i++)
                sb.append(0);

            return sb.toString();
        }

//        System.out.println(frac);

        //Normalize的过程
        int temp = frac.indexOf('1');
        if (BinaryToInteger(exps) <= temp) {
            System.out.println("exponent underflow");
            return null;
        }

        //尾数左移,指数减一
        for (int i = 0; i < temp; i++) {

            frac = frac.substring(1) + "0";
            exps = serialCarryAdder(exps, "11111111", false);

        }

//        System.out.println(sign + " " + exps + " " + frac);

        printlnFloat(sign + exps + frac.substring(1));


        return null;


    }

    public static void add(float X, float Y) {

        String Xs = floatToBinary(X);
        String Ys = floatToBinary(Y);

        printlnFloat(Xs);
        printlnFloat(Ys);

        addFloat(Xs, Ys);
    }


    public static void main(String[] args) {

        add((float) 0.75, (float) -65.25);
    }

}
