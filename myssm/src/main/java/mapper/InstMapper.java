package mapper;

import org.apache.ibatis.annotations.Param;
import po.*;

import java.sql.Timestamp;
import java.util.List;

public interface InstMapper {

    //==================================Counter==================================
    int getEidCount();

    int addEidCount();

    //==================================Instituion==================================

    int addInst(Institution inst);

    Institution findInstByEid(@Param("eid")String eid);

    int addInstModify(Institution inst);

    //==================================Course=====================================

    int addCourse(Course course);

    List<Course> findCourseByEid(@Param("eid")String eid);

    //==================================Section=====================================

    int addSection(Section section);

    //==================================Order=======================================


    int findOrderCount();

    List<Order> findOrder(@Param("offset")int offset,@Param("rows")int rows);

    int addOrder(Order order);

    double sumOfPayed(@Param("eid")String eid);

    double sumOfReturned(@Param("eid")String eid);

    double sumOfOffline(@Param("eid")String eid);

    int getOrder1PayedCount(@Param("eid")String eid);

    int getOrder1ReturnedCount(@Param("eid")String eid);

    int getOrder2Count(@Param("eid")String eid);



    //==================================User=======================================

    User findUser(@Param("username")String username);

    //==================================Member=======================================

    List<Member> findMemberBySid(@Param("sid")int sid);

    int setMemberGrade(@Param("cid")int cid,@Param("username")String username,@Param("grade")int grade);




}
