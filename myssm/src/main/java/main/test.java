package main;

import mapper.CourseMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
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


       List<Course> courses=courseService.findCourseByName("数学");

       for(Course course:courses){
           System.out.println(course);
       }

    }
}
