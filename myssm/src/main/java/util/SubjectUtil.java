package util;

/**
 *
 */
public class SubjectUtil {

    public static String getSort(String sort){
        switch (sort){
            case "1":return "学前辅导";
            case "2":return "小学辅导";
            case "3":return "中学辅导";
            default:break;
        }
        return null;
    }

    public static String getGrade(String sort, String grade){
        switch (sort){
            case "1":switch (grade){
                case "1":return "幼儿";
                case "2":return "幼儿多元智能";
                default:return null;
            }
            case "2":switch (grade){
                case "1":return "一年级";
                case "2":return "二年级";
                case "3":return "三年级";
                case "4":return "四年级";
                case "5":return "五年级";
                case "6":return "六年级";
                default:return null;
            }
            case "3":switch (grade){
                case "1":return "初一";
                case "2":return "初二";
                case "3":return "中考";
                case "4":return "高一";
                case "5":return "高二";
                case "6":return "高三";
                default:return null;
            }
            default:break;
        }
        return null;
    }

    public static String getSubject(String sort, String grade, String subject){
        if(sort.equals("3")){
            if (!grade.equals("0")){
                switch (subject){
                    case "1":return "语文";
                    case "2":return "数学";
                    case "3":return "英语";
                    case "4":return "物理";
                    case "5":return "化学";
                    case "6":return "生物";
                    case "7":return "政治";
                    case "8":return "历史";
                    case "9":return "地理";
                    case "10":return "理综";
                    case "11":return "文综";
                    default:return null;
                }
            }else return null;
        }else if (grade.equals("1")||grade.equals("2")){
            if (!grade.equals("0")){
                switch (subject){
                    case "1":return "英语";
                    case "2":return "数学";
                    case "3":return "语文";
                    default:return null;
                }
            }else return null;
        }
        return null;
    }


    public static int[] getNums(String sort,String grade,String subject){

        int[] nums=new int[3];

        if(sort.equals("学前辅导")){

            nums[0]=1;

            switch (grade) {
                case "幼儿":
                    nums[1] = 1;
                    break;
                case "幼儿多元智能":
                    nums[1] = 2;
                    break;
                default:
                    nums[1] = 0;
                    break;
            }

            switch (subject) {
                case "英语":
                    nums[2] = 1;
                    break;
                case "数学":
                    nums[2] = 2;
                    break;
                case "语文":
                    nums[2] = 3;
                    break;
                default:
                    nums[2] = 0;
                    break;
            }



        }else if(sort.equals("小学辅导")){

            nums[0]=2;

            switch (grade) {
                case "一年级":
                    nums[1] = 1;
                    break;
                case "二年级":
                    nums[1] = 2;
                    break;
                case "三年级":
                    nums[1] = 3;
                    break;
                case "四年级":
                    nums[1] = 4;
                    break;
                case "五年级":
                    nums[1] = 5;
                    break;
                case "六年级":
                    nums[1] = 6;
                    break;
                default:
                    nums[1] = 0;
                    break;
            }


            switch (subject) {
                case "英语":
                    nums[2] = 1;
                    break;
                case "数学":
                    nums[2] = 2;
                    break;
                case "语文":
                    nums[2] = 3;
                    break;
                default:
                    nums[2] = 0;
                    break;
            }

        }else if(sort.equals("中学辅导")){

            nums[0]=3;

            switch (grade) {
                case "初一":
                    nums[1] = 1;
                    break;
                case "初二":
                    nums[1] = 2;
                    break;
                case "中考":
                    nums[1] = 3;
                    break;
                case "高一":
                    nums[1] = 4;
                    break;
                case "高二":
                    nums[1] = 5;
                    break;
                case "高三":
                    nums[1] = 6;
                    break;
                default:
                    nums[1] = 0;
                    break;
            }

            switch (subject) {
                case "语文":
                    nums[2] = 1;
                    break;
                case "数学":
                    nums[2] = 2;
                    break;
                case "英语":
                    nums[2] = 3;
                    break;
                case "物理":
                    nums[2] = 4;
                    break;
                case "化学":
                    nums[2] = 5;
                    break;
                case "生物":
                    nums[2] = 6;
                    break;
                case "政治":
                    nums[2] = 7;
                    break;
                case "历史":
                    nums[2] = 8;
                    break;
                case "地理":
                    nums[2] = 9;
                    break;
                case "理综":
                    nums[2] = 10;
                    break;
                case "文综":
                    nums[2] = 11;
                    break;
                default:
                    nums[2] = 0;
                    break;
            }

        }else{

            nums[0]=0;
            nums[1]=0;
            nums[2]=0;
        }

        return nums;
    }
}
