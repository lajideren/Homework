package util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;

public class NumberUtil {

    public static double formatDouble2(double d) {
        // 新方法，如果不需要四舍五入，可以使用RoundingMode.DOWN
        BigDecimal bg = new BigDecimal(d).setScale(2, RoundingMode.UP);


        return bg.doubleValue();

    }

    public static String formatInt7(int num){
        DecimalFormat df=new DecimalFormat("0000000");
        return df.format(num);
    }
}
