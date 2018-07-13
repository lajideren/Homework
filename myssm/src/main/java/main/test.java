package main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import po.*;
import service.AdminService;
import service.ClientService;
import service.InstService;
import service.CourseService;
import util.NumberUtil;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class test {

    public static void main(String[] args) {
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("spring/applicationContext-*.xml");
        ClientService clientService=(ClientService) applicationContext.getBean("clientService");

        System.out.println(clientService.register("wsy","111","111@qq.ocom"));




    }
}
