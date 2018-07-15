package mapper;

import org.apache.ibatis.annotations.Param;
import pobject.Comment;
import pobject.Course;

import java.sql.Timestamp;
import java.util.List;

public interface CourseMapper {

    /**
     *
     * @param sort 种类
     * @param city 城市
     * @return
     */
    List<Course> findCourseRand(@Param("sort")String sort,@Param("city")String city);


    /**
     * 通过课程名称模糊查找课程
     * @param cname
     * @return 最多返回10个
     */
    List<Course> findCourseByName(@Param("cname")String cname);


    /**
     * 通过id查找课程
     * @param cid
     * @return
     */
    Course findCourseById(@Param("cid")String cid);


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

    int findCourseCount(@Param("sort")String sort,@Param("grade")String grade,@Param("subject")String subject);


    String findTeacher(@Param("cid")String cid);


    List<Comment> findComment(@Param("cid")String cid);


    void addComment(@Param("cid")String cid, @Param("username")String username, @Param("content")String content, @Param("createTime")Timestamp createTime);
}
