public class ALU {


    /**
     * 将浮点数转换为二进制形式
     *
     * @param number  实际值，例如-1.5，是String型的
     * @param eLength 指数部分长度
     * @param sLength 尾数部分长度,一个浮点数总长是1+eLength+sLength,sLength不包括隐藏的1
     *                必须处理所有的情况包括0,INF,-INF
     */
    public String floatRrepresentation(String number, int eLength, int sLength) {

        StringBuffer sb = new StringBuffer();
        String sign;
        String exps;
        String frac;

        float f = Float.parseFloat(number);
        if (f < 0) {
            f = -f;
            sign = "1";
        } else {
            sign = "0";
        }

        if (f == 0) {
            for (int i = 0; i < (1 + eLength + sLength); i++)
                sb.append(0);
            return sb.toString();
        }

        int a = (int) f;
        float b = f - (int) f;

        sb.setLength(0);
        while (a != 0) {

            sb.insert(0, a % 2);
            a = a / 2;

        }
        String as = sb.toString();

        sb.setLength(0);
        while (b != 0) {

            sb.append(b * 2 >= 1 ? 1 : 0);
            b = b * 2 - (int) (b * 2);

        }
        String bs = sb.toString();


        int exp;
        if (as.length() > 0) {
            exp = as.length() - 1;
        } else {
            exp = -(bs.indexOf('1') + 1);
        }

        //记得加上bias
        exp += pow(2, eLength - 1) - 1;
        exps = IntegerToBinary(exp, eLength);


        frac = as + bs;
        frac = frac.substring(frac.indexOf('1') + 1);
        if (frac.length() > sLength) {
            frac = frac.substring(0, sLength);
        }
        sb.setLength(0);
        sb.append(frac);
        for (int i = 0; i < sLength - frac.length(); i++) {
            sb.append(0);
        }
        frac = sb.toString();


        return sign + exps + frac;

    }


    public String floatTrueValue(String number, int eLength, int sLength) {

        String sign = number.substring(0, 1);
        String exps = number.substring(1, 1 + eLength);
        String frac = "1" + number.substring(1 + eLength);

        int exp = BinaryToInteger(exps);
        //先判断0和无穷的情况
        if (exp == 0)
            return "0";

        if (exp == pow(2, eLength) - 1) {

            if (sign.equals("0"))
                return "INF";
            else
                return "-INF";

        }

        exp -= pow(2, eLength - 1) - 1;//减去bias
        StringBuffer sb = new StringBuffer();
        sb.append(frac);

        if (exp >= 0) {

            if (exp < sLength) {
                sb.insert(exp + 1, ".");
            } else {

                for (int i = 0; i < exp - sLength; i++)
                    sb.append(0);
                sb.append(".");

            }

        } else {

            if (exp == -1) {
                sb.insert(0, ".");
            } else {

                for (int i = 0; i < -exp - 1; i++)
                    sb.insert(0, 0);
                sb.insert(0, ".");

            }

        }

        String str = sb.toString();
        if (str.indexOf(".") == 0)
            str = "0" + str;
        if (str.indexOf(".") == str.length() - 1)
            str = str + "0";

        String as = str.substring(0, str.indexOf("."));
        String bs = str.substring(str.indexOf(".") + 1);

        int a = BinaryToInteger(as);
        float b = 0;
        for (int i = 0; i < bs.length(); i++) {

            //此处要写1.0
            if (bs.charAt(i) == '1')
                b += 1.0 / pow(2, i + 1);

        }

        float f = a + b;
        return Float.toString(f);

    }

    public boolean isZero(String str) {

        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == '1')
                return false;
        }

        return true;

    }

    public int pow(int base, int exp) {

        int num = 1;
        for (int i = 0; i < exp; i++) {
            num *= base;
        }
        return num;

    }

    public int BinaryToInteger(String exps) {

        int num = 0;
        for (int i = 0; i < exps.length(); i++) {
            num = num * 2 + exps.charAt(i) - '0';
        }
        return num;

    }

    public String IntegerToBinary(int exp, int eLength) {

        String exps = Integer.toBinaryString(exp);
        StringBuffer sb = new StringBuffer();
        sb.append(exps);
        for (int i = 0; i < eLength - exps.length(); i++) {

            sb.insert(0, 0);

        }

        return sb.toString();

    }


    /**
     * 串行进位加法器，必须使用到fullAdder方法
     * 返回的String长度是len+1
     */
    public String serialCarryAdder(String x, String y) {


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
    public String leftShift(String str, int n) {

        for (int i = 0; i < n; i++) {

            str = str.substring(1) + '0';

        }

        return str;

    }

    /**
     * 逻辑右移，左边补0
     */
    public String logicalRightShift(String str, int n) {

        for (int i = 0; i < n; i++) {

            str = '0' + str.substring(0, str.length() - 1);

        }

        return str;
    }


    /**
     * 按位取反(给出的方法没有加1，需要用串行进位加法器加1）
     */
    public String negation(String str) {

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
    public char[] fullAdder(char x, char y, char c) {

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
