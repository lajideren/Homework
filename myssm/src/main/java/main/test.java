package main;

import mapper.CourseMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pobject.Comment;
import pobject.Course;
import pobject.Order;
import service.*;
import util.NumberUtil;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class test {

    public static void main(String[] args) {
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("spring/applicationContext-*.xml");
       CourseService courseService =(CourseService) applicationContext.getBean("courseService");


//       courseService.addComment("GY1089","wsy","范德萨发放是的范德萨发送到发送到对方水电费是");
//        courseService.addComment("GY1089","wsy","范德萨发放是的范德萨发送fsfsd");
//        courseService.addComment("GY1089","wsy","范德fsd s s到发送到对方水电费是");

        int size1,size2,size3;

        List<Course> courses1=courseService.findCourseTop10("学前辅导","长沙");
        size1= courses1==null? 0:courses1.size();
        List<Course> courses2=courseService.findCourseTop10("小学辅导","长沙");
        size2= courses2==null? 0:courses2.size();
        List<Course> courses3=courseService.findCourseTop10("中学辅导","长沙");
        size3= courses3==null? 0:courses3.size();
        System.out.println(size1+" "+size2+" "+size3);




    }
}
