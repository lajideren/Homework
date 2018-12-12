public class Floating1 {

    public static void printlnFloat(String str, int explen) {

        for (int i = 0; i < str.length(); i++) {
            System.out.print(str.charAt(i));
            if (i == 0 || i == explen || i > explen && (i - explen) % 4 == 0)
                System.out.print(" ");
        }
        System.out.println();
    }

    public static String floatToBinary(float f, int explen, int fraclen) {

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
            for (int i = 0; i < (explen + fraclen); i++)
                sb.append('0');
            return sb.toString();
        }

        //插入小数点
        sb.setLength(0);
        sb.append(as);
        sb.append(bs);
//        System.out.println(bs);
//        sb.insert(sb.indexOf("1") + 1, ".");

        //取得尾数部分,补到24位
        String s = sb.toString();
        String frac = s.substring(s.indexOf('1'));
        //取最多24位
        if (frac.length() > fraclen)
            frac = frac.substring(0, fraclen);
        sb.setLength(0);
        sb.append(frac);
        for (int i = 0; i < fraclen - frac.length(); i++) {
            sb.append('0');
        }
        frac = sb.toString();

        //获得符号位
        String sign = flag ? "0" : "1";


        //求bias
        sb.setLength(0);
        for (int i = 0; i < explen - 1; i++) {
            sb.append(1);
        }
        int bias = BinaryToInteger(sb.toString());


        //获得指数部分，补到8位
        String exps = Integer.toBinaryString(exp + bias);//加上127的bias
        sb.setLength(0);
        sb.append(exps);
        for (int i = 0; i < explen - exps.length(); i++) {
            sb.insert(0, '0');
        }
        exps = sb.toString();


//        System.out.println(as + "." + bs + " " + exp);

//        System.out.println(sign + " " + exps + " " + frac);
        return sign + exps + frac.substring(1);

    }

    public static float binaryToFloat(String str, int explen, int fraclen) {

//        printlnFloat(str, explen);

        String sign = str.substring(0, 1);
        String exps = str.substring(1, 1 + explen);
        String frac = "1" + str.substring(1 + explen);

        StringBuffer sb = new StringBuffer();
        sb.append(frac);
        int exp = BinaryToInteger(exps) - (pow(2, explen - 1) - 1);//减去bias

        if (exp > 0) {

            if (exp <= fraclen - 2) {
                sb.insert(exp + 1, ".");
            } else if (exp == fraclen - 1) {
                sb.append(".");
            } else {

                for (int i = 0; i < exp - (fraclen - 1); i++) {
                    sb.append(0);
                }
                sb.append(".");

            }

        } else if (exp < 0) {

            if (exp == -1) {
                sb.insert(0, ".");
            } else {

                for (int i = 0; i < (-exp) - 1; i++) {
                    sb.insert(0, 0);
                }
                sb.insert(0, ".");
            }

        } else {
            sb.insert(1, ".");
        }

//        System.out.println(sb.toString());

        String temp = sb.toString();
        if (temp.indexOf(".") == 0) {
            temp = "0" + temp;
        } else if (temp.indexOf(".") == temp.length() - 1) {
            temp = temp + "0";
        }

//        System.out.println(temp);

        String as = temp.substring(0, temp.indexOf("."));
        String bs = temp.substring(temp.indexOf(".") + 1);

//        System.out.println(as);
//        System.out.println(bs);

        int num1 = 0;
        for (int i = 0; i < as.length(); i++) {
            num1 = num1 * 2 + as.charAt(i) - '0';
        }

//        System.out.println(num1);


        float num2 = 0;
        for (int i = 0; i < bs.length(); i++) {

            if (bs.charAt(i) == '1') {
                num2 += 1.0 / (pow(2, i + 1));
            }

        }

//        System.out.println(num2);

        float num = num1 + num2;
        if (sign.equals("1"))
            num = -num;

//        System.out.println(num);

        return num;

    }

    public static int pow(int base, int exp) {

        int sum = 1;
        for (int i = 0; i < exp; i++) {
            sum *= base;
        }

        return sum;
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
    public static String addFloat(String X, String Y, int explen, int fraclen, int ALUlen, int round) {


        String expsX = X.substring(1, explen + 1);
        String expsY = Y.substring(1, explen + 1);

        int expX = BinaryToInteger(expsX);
        int expY = BinaryToInteger(expsY);

        //指数差值，是之后尾数移位的次数
        boolean exchange;
        int expDif;
        if (expX > expY) {
            String temp = Y;
            Y = X;
            X = temp;
            expDif = expX - expY;
            exchange = true;
        } else {
            expDif = expY - expX;
            exchange = false;
        }

        String signX = X.substring(0, 1);
        String signY = Y.substring(0, 1);
        expsX = X.substring(1, explen + 1);
        expsY = Y.substring(1, explen + 1);

        String fracX = "1" + X.substring(explen + 1);
        String fracY = "1" + Y.substring(explen + 1);

        //使用保护位
        for (int i = 0; i < ALUlen - fraclen; i++) {
            fracX += '0';
            fracY += '0';
        }

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


            if (frac.length() > fracX.length()) {
                frac = frac.substring(1);
                //如果X,Y交换，结果取反
                sign = exchange ? "1" : "0";
            } else {//没有进位需要取反
                frac = negateBinary(frac);
                sign = exchange ? "0" : "1";
            }


        } else {

            frac = serialCarryAdder(fracX, fracY, true);
            //有进位溢出,则右移尾数
            if (frac.length() > fracX.length()) {

                frac = frac.substring(0, frac.length() - 1);

                //判断指数是否上溢
                StringBuffer sb = new StringBuffer();
                for (int i = 0; i < explen; i++) {
                    sb.append(1);
                }
                int max = BinaryToInteger(sb.toString());

                if (BinaryToInteger(exps) == max - 1) {
                    System.out.println("exponent overflow");
                    return null;
                }

                sb.setLength(0);
                for (int i = 0; i < explen; i++) {
                    if (i != explen - 1)
                        sb.append(0);
                    sb.append(1);
                }
                exps = serialCarryAdder(exps, sb.toString(), false);


            }

            sign = "0";

        }

        if (isZero(frac)) {
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < explen + fraclen; i++)
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

            StringBuffer sb = new StringBuffer();
            for (int k = 0; k < explen; k++) {
                sb.append(1);
            }

            exps = serialCarryAdder(exps, sb.toString(), false);

        }

//        System.out.println(sign + " " + exps + " " + frac);

        printlnFloat(sign + exps + frac.substring(1), exps.length());

        //尾数round过程，不考虑尾数上溢和下溢的情况
        if (fraclen < ALUlen) {

            String guard = frac.substring(fraclen);
            frac = frac.substring(0, fraclen);

            if (!isZero(guard)) {

                if (round == 0) {//朝0舍入

                } else if (round == 1) {//就近舍入


                    if (guard.charAt(0) == '1') {//超过一半

                        StringBuffer sb = new StringBuffer();
                        for (int i = 0; i < fraclen; i++) {
                            if (i != fraclen - 1) sb.append(0);
                            else sb.append(1);
                        }
                        frac = serialCarryAdder(frac, sb.toString(), false);

                    }


                } else if (round == 2) {//正无穷舍入


                    if (sign.equals("0")) {//如果为正数给尾数加一

                        StringBuffer sb = new StringBuffer();
                        for (int i = 0; i < fraclen; i++) {
                            if (i != fraclen - 1) sb.append(0);
                            else sb.append(1);
                        }
                        frac = serialCarryAdder(frac, sb.toString(), false);

                    }


                } else {//负无穷舍入


                    if (sign.equals("1")) {

                        StringBuffer sb = new StringBuffer();
                        for (int i = 0; i < fraclen; i++) {
                            if (i != fraclen - 1) sb.append(0);
                            else sb.append(1);
                        }
                        frac = serialCarryAdder(frac, sb.toString(), false);

                    }

                }

            }

        }


//        printlnFloat(sign + exps + frac.substring(1), exps.length());


        return sign + exps + frac.substring(1);


    }

    public static void add(float X, float Y, int explen, int fraclen, int ALUlen, int round) {

        if (X == 0) {
            String Ys = floatToBinary(Y, explen, fraclen);
            printlnFloat(Ys, explen);
            System.out.println(binaryToFloat(Ys, explen, fraclen));

        } else if (Y == 0) {
            String Xs = floatToBinary(X, explen, fraclen);
            printlnFloat(Xs, explen);
            System.out.println(binaryToFloat(Xs, explen, fraclen));
        } else {
            String Xs = floatToBinary(X, explen, fraclen);
            String Ys = floatToBinary(Y, explen, fraclen);
//
            printlnFloat(Xs, explen);
            printlnFloat(Ys, explen);

            String res = addFloat(Xs, Ys, explen, fraclen, ALUlen, round);
            printlnFloat(res, explen);
//
            System.out.println(binaryToFloat(res, explen, fraclen));
        }
    }


    public static String mulFloat(String X, String Y, int explen, int fraclen) {

        String signX = X.substring(0, 1);
        String signY = Y.substring(0, 1);
        String expXs = X.substring(1, 1 + explen);
        String expYs = Y.substring(1, 1 + explen);
        String fracX = "1" + X.substring(1 + explen);
        String fracY = "1" + Y.substring(1 + explen);

        int expX = BinaryToInteger(expXs);
        int expY = BinaryToInteger(expYs);

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < explen - 1; i++) {
            sb.append(1);
        }
        int bias = BinaryToInteger(sb.toString());

        //========这里有一点疑问，max是否可以为全1，即无穷的情况=========
        int max = 2 * bias;
        int min = 1;
        int exp = expX + expY - bias;
        if (exp > max) {
            System.out.println("exponent overflow");
            return null;
        }
        if (exp < min) {
            System.out.println("exponent underflow");
            return null;
        }

        //先补上一个零，防止溢出
        fracX = "0" + fracX;
        fracY = "0" + fracY;

        String frac = mulBinary(fracX, fracY);

        //前两位必定为0,看是否有最后的进位
        if(frac.indexOf("1")==2){
            exp=exp+1;
        }
        frac = frac.substring(frac.indexOf("1"), frac.indexOf("1") + fraclen);



        String exps = Integer.toBinaryString(exp);
        sb.setLength(0);
        sb.append(exps);
        for (int i = 0; i < explen - exps.length(); i++) {
            sb.insert(0, "0");
        }
        exps = sb.toString();

        String sign = signX.equals(signY) ? "0" : "1";


        return sign + exps + frac.substring(1);
    }


    public static void mul(float X, float Y, int explen, int fraclen) {

        String Xs = floatToBinary(X, explen, fraclen);
        String Ys = floatToBinary(Y, explen, fraclen);
        printlnFloat(Xs, explen);
        printlnFloat(Ys, explen);

        String res = mulFloat(Xs, Ys, explen, fraclen);
        printlnFloat(res, explen);
        System.out.println(binaryToFloat(res, explen, fraclen));


    }


    public static String mulBinary(String X, String Y) {

        int len = X.length();

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < len; i++) {
            sb.append(0);
        }
        String P = sb.toString();

        for (int i = len - 1; i >= 0; i--) {

            if (Y.charAt(i) == '1') {
                P = serialCarryAdder(P, X, false);
            }

            P = "0" + P;
            X = X + "0";

        }

//        System.out.println(P);

        return P;
    }

    public static String divFloat(String X,String Y,int explen,int fraclen){

        String signX=X.substring(0,1);
        String signY=Y.substring(0,1);
        String expXs=X.substring(1,1+explen);
        String expYs=Y.substring(1,1+explen);
        String fracX="1"+X.substring(1+explen);
        String fracY="1"+Y.substring(1+explen);

        int expX=BinaryToInteger(expXs);
        int expY=BinaryToInteger(expYs);


        //计算指数，判断是否在范围内
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<explen-1;i++){
            sb.append(1);
        }
        int bias=BinaryToInteger(sb.toString());
        int exp=expX-expY+bias;
        int max=2*bias;
        int min=1;
        if(exp>max){
            System.out.println("exponent overflow");
            return null;
        }
        if(exp<min){
            System.out.println("exponent underflow");
            return null;
        }

        String as=fracX;
        String bs=fracY;
        System.out.println(as);
        System.out.println(bs);
        String frac=divByRec(as,bs);
        System.out.println(frac);

        int temp=frac.indexOf('1');
        for(int i=0;i<temp;i++){
            frac+='0';
        }
        frac=frac.substring(temp);
        exp-=temp;

        String exps = Integer.toBinaryString(exp);
        sb.setLength(0);
        sb.append(exps);
        for (int i = 0; i < explen - exps.length(); i++) {
            sb.insert(0, "0");
        }
        exps = sb.toString();

        String sign = signX.equals(signY) ? "0" : "1";


        return sign + exps + frac.substring(1);




    }

    public static void div(float X,float Y,int explen,int fraclen){

        String Xs = floatToBinary(X, explen, fraclen);
        String Ys = floatToBinary(Y, explen, fraclen);
        printlnFloat(Xs, explen);
        printlnFloat(Ys, explen);

        String res = divFloat(Xs, Ys, explen, fraclen);
        printlnFloat(res, explen);
        System.out.println(binaryToFloat(res, explen, fraclen));

    }


    /**
     * 无符号的除法
     */
    public static String divByRec(String X, String Y) {

        int len = X.length();
            Y = negateBinary(Y);


//        System.out.println(X);
//        System.out.println(Y);

        //
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < len; i++) {



            String temp=serialCarryAdder(X,Y,true);
            if(temp.length()>X.length()){
                X=temp.substring(1);
                sb.append(1);
            }else {
                sb.append(0);
            }

            X = X.substring(1)+"0";

        }

        String remainder=X;
        String quotient=sb.toString();
        return quotient;


    }


    public static void main(String[] args) {


//        System.out.println(mul());




        int explen = 8;
        int fraclen = 24;

        float f1 = (float) 0.75;
        float f2 = (float) -65.25;
//
        div(f1, f2, explen, fraclen);

//        System.out.println(divByRec("111","100"));



//        int explen = 8;
//        int fraclen = 24;
//        int ALUlen = 24;
//
//        float f1 = (float) 0;
//        float f2 = (float) 384.13;
//
//
//        add(f1, f2, explen, fraclen, ALUlen, 0);
//        System.out.println();
//        add(f1, f2, explen, fraclen, ALUlen, 1);
//        System.out.println();
//        add(f1, f2, explen, fraclen, ALUlen, 2);
//        System.out.println();
//        add(f1, f2, explen, fraclen, ALUlen, 3);

    }


}
