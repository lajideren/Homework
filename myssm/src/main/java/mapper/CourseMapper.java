package mapper;

import org.apache.ibatis.annotations.Param;
import pobject.Course;

import java.util.List;

public interface CourseMapper {
    List<Course> findPrimaryCourse();
}
