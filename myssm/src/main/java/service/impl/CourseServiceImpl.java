package service.impl;

import mapper.AdminMapper;
import mapper.CourseMapper;
import mapper.InstMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import po.Apply;
import po.Institution;
import po.User;
import pobject.Course;
import service.AdminService;
import service.CourseService;

import java.sql.Timestamp;
import java.util.List;

public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> findPrimaryCourse() {
        return courseMapper.findPrimaryCourse();
    }

    @Override
    public List<Course> findCourseTop10(String sort, String city) {
        return null;
    }

    @Override
    public List<Course> findLikeCourseTop5() {
        return null;
    }

    @Override
    public List<Course> findCourseByName(String cname) {
        return null;
    }

    @Override
    public Course findCourseById(String cid) {
        return null;
    }

    public static void main(String[] args) {
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("spring/applicationContext-*.xml");
        CourseService courseService=(CourseService) applicationContext.getBean("courseService");
        List<Course> courses = courseService.findPrimaryCourse();
        for(Course co:courses){
            System.out.println(co.getCid());
        }
    }
}
