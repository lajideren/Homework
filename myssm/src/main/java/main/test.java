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


       System.out.println(courseService.findCoursePageCount("学前辅导",null,null,9));




    }
}
