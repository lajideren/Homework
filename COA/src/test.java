public class test {

    public static String DecimalToBinary(int n) {

        StringBuffer sb = new StringBuffer();

        while (n != 0) {
            sb.append(n % 2);
            n = n / 2;
        }

        return sb.reverse().toString();
    }


    public static void floatToBinary(float f) {


        if (f < 0) f = -f;
        float b = f - (int) f;

        StringBuffer sb = new StringBuffer();
        //转换小数部分为二进制
        sb.setLength(0);
        while (b != 0) {
            sb.append(b * 2 >= 1 ? '1' : '0');
            b = b * 2 - (int) (b * 2);
        }
        String bs = sb.toString();

        for(int i=0;i<sb.length();i++){
            if(i%4==0)
                System.out.print(" ");
            System.out.print(sb.charAt(i));
        }
    }

    public static void main(String[] args) {

        floatToBinary((float) 0.13);
    }
}
