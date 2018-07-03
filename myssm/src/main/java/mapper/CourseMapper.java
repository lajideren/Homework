package mapper;

import org.apache.ibatis.annotations.Param;
import pobject.Course;

import java.util.List;

public interface CourseMapper {
    List<Course> findPrimaryCourse();
    /**
     * 找出前10个课程
     * @param sort 种类
     * @param city 城市
     * @return
     */
    List<Course> findCourseTop10(@Param("sort")String sort,@Param("city")String city);

    /**
     * 随机推荐5门课程
     * @return
     */
    List<Course> findLikeCourseTop5();


    /**
     * 通过课程名称模糊查找课程
     * @param cname
     * @return 最多返回10个
     */
    List<Course> findCourseByName(String cname);


    /**
     * 通过id查找课程
     * @param cid
     * @return
     */
    Course findCourseById(String cid);


    /**
     * 页的大小是9，写死在代码
     * @param sort
     * @param grade
     * @param subject
     * @param pageNum 第几页
     * @param pageSize 每页大小
     * @return
     */
    List<Course> findCourse(@Param("sort")String sort,@Param("grade")String grade,@Param("subject")String subject,@Param("pageNum")int pageNum, @Param("pageSize")int pageSize);
}
