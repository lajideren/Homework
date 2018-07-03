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
}
