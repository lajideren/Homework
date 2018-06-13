package util;

public class LevelUtil {

    public static int getLevel(Double total_money){

        Double[] tbl={1000.0,2000.0,3000.0,4000.0,5000.0};

        int i;

        for(i=0;i<tbl.length;i++){
            if(total_money<tbl[i]){
                return i;
            }
        }

        return i;


    }
}
