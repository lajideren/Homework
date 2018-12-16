import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class ALUTest {

    @Test
    public void test1_operand1() {

        String sign = "0";
        String exps = "01111110";
        String frac = "00000000000000000000000";

        String expected = sign + exps + frac;
        String actual = new ALU().floatRrepresentation("0.5", 8, 23);

        assertEquals(expected, actual);

    }

    @Test
    public void test1_operand2() {

        String sign = "1";
        String exps = "01111101";
        String frac = "11000000000000000000000";

        String expected = sign + exps + frac;
        String actual=new ALU().floatRrepresentation("-0.4375", 8, 23);

        assertEquals(expected, actual);

    }


    @Test
    public void test1_floatTrueValue(){

//        assertEquals("0.9375",new ALU().floatTrueValue("00111111011100000000000000000000",8,23));
        assertEquals("-INF",new ALU().floatTrueValue("11111111100000000000000000000000",8,23));
    }



    @Test
    public void test2_operand1(){

        String sign = "0";
        String exps = "00000000";
        String frac = "00000000000000000000000";

        String expected = sign + exps + frac;
        String actual=new ALU().floatRrepresentation("0", 8, 23);

        assertEquals(expected, actual);

    }
}
