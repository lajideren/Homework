package util;

import java.sql.Date;
import java.sql.Timestamp;

public class MoneyUtil {

    public static double getReturnMoney(double realMoney, Date start_time){

        long days=(long)(start_time.getTime()- System.currentTimeMillis())/(24*60*60*1000l);
//        System.out.println(days);
        int[] tbl={28,21,14,7,0};
        for(int i=0;i<tbl.length;i++){
            if(days>tbl[i]){
                return NumberUtil.formatDouble2(realMoney*(1-20*i*0.01)) ;
            }
        }

        return 0.0;

    }

    public static void main(String[] args) {
        Date t=Date.valueOf("2018-03-05");
        System.out.println(MoneyUtil.getReturnMoney(1000.0,t));
    }
}
