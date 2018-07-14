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
}
