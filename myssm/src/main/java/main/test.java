package main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import po.*;
import service.AdminService;
import service.InstService;
import service.CourseService;
import util.NumberUtil;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class test {

    public static void main(String[] args) {
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("spring/applicationContext-*.xml");
        AdminService adminService=(AdminService) applicationContext.getBean("");
////        System.out.println(adminService.getRegCount());
////        System.out.println(adminService.getModifyCount());
//
//        List<Course> applies1=CourseService.findPrimaryCourse();
//        List<Apply> applies2=adminService.findAllModify();
//
//        for(Apply apply:applies1){
//            System.out.println(apply);
//        }
//
//        for(Apply apply:applies2){
//            System.out.println(apply);
//        }

//        System.out.println(new Timestamp(1518658151000l));


    }
}
