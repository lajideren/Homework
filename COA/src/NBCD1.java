public class NBCD1 {

    //把整数转换为4位的string
    public static String toBinaryString(int n) {

        String str = Integer.toBinaryString(n);
        StringBuffer sb = new StringBuffer();
        sb.append(str);
        for (int i = 0; i < 4 - str.length(); i++) {
            sb.insert(0, "0");
        }

        return sb.toString();

    }

    public static void printlnNBCD(String str) {

        for (int i = 0; i < str.length(); i++) {
            if (i % 4 == 0)
                System.out.print(" ");
            System.out.print(str.charAt(i));
        }

        System.out.println();
    }


    public static String toNBCDString(int n) {

        if (n < 0) n = -n;

        String str = Integer.toString(n);
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < str.length(); i++) {

            sb.append(toBinaryString(str.charAt(i) - '0'));

        }

        return sb.toString();


    }

    public static int NBCDToInteger(String str){

        int sum=0;

        for(int i=0;i<str.length()/4;i++){

            String tempStr=str.substring(i*4,(i+1)*4);
            int tempNum=0;
            for(int k=0;k<4;k++){
                tempNum=tempNum*2+tempStr.charAt(k)-'0';
            }
            sum=sum*10+tempNum;

        }

        return sum;

    }

    public static String serialCarryAdder(String X, String Y, boolean carry) {

        int len = X.length();

        int Xi, Yi, Ci, Ci1, Si;
        Ci1 = 0;

        StringBuffer sb = new StringBuffer();

        for (int i = len - 1; i >= 0; i--) {

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

    public static String negateNBCD(String str) {

        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < str.length() / 4; i++) {

            String temp = str.substring(i * 4, (i + 1) * 4);
            StringBuffer sb_temp = new StringBuffer();
            for (int k = 0; k < temp.length(); k++) {
                sb_temp.append(temp.charAt(k) == '0' ? '1' : '0');
            }
            temp = serialCarryAdder(sb_temp.toString(), "1010", false);
            sb.append(temp);

        }

        String res = sb.toString();
        sb.setLength(0);
        for (int i = 0; i < res.length(); i++) {

            if (i != res.length() - 1)
                sb.append(0);
            else
                sb.append(1);

        }

        res = serialCarryAdder(res, sb.toString(), false);

        return res;


    }


    public static String addNBCD(String X, String Y) {


        int C = 0;
        StringBuffer sb = new StringBuffer();

        for (int i = X.length() / 4 - 1; i >= 0; i--) {

            String tempX = X.substring(i * 4, (i + 1) * 4);
            String tempY = Y.substring(i * 4, (i + 1) * 4);
            String temp;

            if (C == 1) {
                tempX = serialCarryAdder(tempX, "0001", false);
            }
            temp = serialCarryAdder(tempX, tempY, true);
            if (temp.length() > 4) {
                C = 1;
                temp = serialCarryAdder(temp.substring(1), "0110", false);
            } else if (temp.charAt(0) == '1' && temp.charAt(1) == '1' || temp.charAt(0) == '1' && temp.charAt(2) == '1') {
                C = 1;
                temp = serialCarryAdder(temp, "0110", false);
            } else {
                C = 0;
            }

            sb.insert(0, temp);

        }

        if (C == 1) {
            sb.insert(0, "0001");
        }

        return sb.toString();

    }


    public static void add(int X,int Y){

        if(Y>=0) {

            String Xs = toNBCDString(X);
            String Ys = toNBCDString(Y);

            printlnNBCD(Xs);
            printlnNBCD(Ys);

            String res=addNBCD(Xs, Ys);

            printlnNBCD(res);
            System.out.println(NBCDToInteger(res));


        }else {

            String Xs = toNBCDString(X);
            String Ys = toNBCDString(-Y);

            printlnNBCD(Xs);
            printlnNBCD(Ys);

            String res=addNBCD(Xs,negateNBCD(Ys));
            if(res.length()>Xs.length()){
                res=res.substring(4);
                printlnNBCD(res);
                System.out.println(NBCDToInteger(res));
            }else {
                res=negateNBCD(res);
                printlnNBCD(res);
                System.out.println("-"+NBCDToInteger(res));
            }




        }

    }


    public static void main(String[] args) {



        add(98,79);
    }

}
