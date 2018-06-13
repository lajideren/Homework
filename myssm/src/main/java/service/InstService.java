package service;

import po.*;
import resultmsg.Result_Inst;

import java.sql.Timestamp;
import java.util.List;

public interface InstService {

    //=============================counter=============================

    String genEid();

    //=============================Inst=============================

    boolean addInst(Institution inst);

    Result_Inst login(String eid,String password);

    Institution findInstByEid(String eid);

    boolean addInstModify(Institution inst);

    //=============================Course============================

    boolean addCourse(Course course);

    List<Course> findCourseByEid(String eid);

    //=============================Section============================

    boolean addSection(Section section);

    //=============================Order============================

    int findOrderCount(int pageSize);

    List<Order> findOrder(int pageNum,int pageSize);

    void addOrder(String[] members,int cid,int sid,String username,String eid);

    //=============================User=============================

    User findUser(String username);

    //=============================Member=============================

    List<Member> findMemberBySid(int sid);

    void setMemberGrade(int cid,String username,int grade);

    //============================Stat================================

    double[] computeStat(String eid);



}
