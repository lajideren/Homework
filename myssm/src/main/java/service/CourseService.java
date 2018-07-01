package service;

import pobject.Course;

import java.util.List;

public interface CourseService {



    List<Course> findPrimaryCourse();

    /**
     * 三个条件不是全部需要
     * @param sort 类别
     * @param grade 年级
     * @param subject 科目
     * @return
     */
    List<Course> findCourse(String sort,String grade,String subject);


    /**
     * 通过课程id模糊搜索课程，id完整时返回list的长度为1
     * @param cid
     * @return 返回list类型为了搜索框的模糊搜索
     */
    List<Course> findCourseById(String cid);


    /**
     * 同ById方法
     * @param name
     * @return
     */
    List<Course> findCourseByName(String name);


    /**
     * 随机推荐的课程
     * @param n 数量
     * @returnse
     */
    List<Course> findLikeCourse(int n);


}
