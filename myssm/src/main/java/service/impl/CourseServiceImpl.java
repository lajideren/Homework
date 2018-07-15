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
import pobject.Comment;
import pobject.Course;
import service.AdminService;
import service.CourseService;
import util.RandomUtil;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> findCourseTop10(String sort, String city) {

        List<Course> courses=courseMapper.findCourseRand(sort, city);
        int[] nums=RandomUtil.randomArray(0,courses.size()-1,10);
        List<Course> res=new ArrayList<>();
        for(int i=0;i<10;i++){
             res.add(courses.get(nums[i]));
        }

        return res;
    }

    @Override
    public List<Course> findLikeCourseTop5() {

        List<Course> courses=courseMapper.findCourseRand(null, null);
        int[] nums=RandomUtil.randomArray(0,courses.size()-1,5);
        List<Course> res=new ArrayList<>();

        for(int i=0;i<5;i++){
            res.add(courses.get(nums[i]));
        }

        return res;
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

        return courseMapper.findCourse(sort, grade, subject, pageNum, pageSize);
    }

    @Override
    public int findCoursePageCount(String sort, String grade, String subject,int pageSize) {
        int count=courseMapper.findCourseCount(sort, grade, subject);

        return count%pageSize==0 ? count/pageSize : count/pageSize+1 ;
    }

    @Override
    public String[] findTeacher(String cid) {
        return courseMapper.findTeacher(cid).split(",");

    }

    @Override
    public List<Comment> findComment(String cid) {
        return courseMapper.findComment(cid);
    }

    @Override
    public void addComment(String cid, String username, String content) {
        courseMapper.addComment(cid,username,content,new Timestamp(System.currentTimeMillis()));
    }

}
