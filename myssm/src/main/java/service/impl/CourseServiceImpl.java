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
    public List<Course> findCourseTop10(String sort, String city) {
        return courseMapper.findCourseTop10(sort, city);
    }

    @Override
    public List<Course> findLikeCourseTop5() {

        return courseMapper.findLikeCourseTop5();
    }

    @Override
    public List<Course> findCourseByName(String cname) {

        return courseMapper.findCourseByName(cname);
    }

    @Override
    public Course findCourseById(String cid) {
        return courseMapper.findCourseById(cid);

    }

    @Override
    public List<Course> findCourse(String sort, String grade, String subject, int pageNum, int pageSize) {
        return null;
    }

    public static void main(String[] args) {
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("spring/applicationContext-*.xml");
        CourseService courseService=(CourseService) applicationContext.getBean("courseService");
        List<Course> courses = courseService.findCourseTop10("小学辅导","长沙");
        for(Course co:courses){
            System.out.println(co.getCname());
        }
    }
}
