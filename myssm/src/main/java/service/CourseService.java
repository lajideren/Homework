package service;

import pobject.Course;

import java.util.List;

public interface CourseService {



    List<Course> findPrimaryCourse();

    /**
     * 找出前10个课程
     * @param sort 种类
     * @param city 城市
     * @return
     */
    List<Course> findCourseTop10(String sort,String city);

    /**
     * 随机推荐5门课程
     * @return
     */
    List<Course> findLikeCourseTop5();


    /**
     * 同ById方法
     * @param cname
     * @return 最多返回10个
     */
    List<Course> findCourseByName(String cname);





}
