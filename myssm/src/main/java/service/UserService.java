package service;

import po.*;
import resultmsg.Result_User;

import java.util.List;

public interface UserService {

    //=============================User=================================

    Result_User login(String username, String password);

    boolean signup(User user);

    boolean active(String code);

    User findUserByName(String username);

    boolean resetPwd(String username,String newPwd);

    boolean changeCredit(String username,Double credit);

    void stopUser(String username);

    //=============================Course=================================

    List<Course> findAllCourses();

    Course findCourseByCid(int cid);

    //=============================Section=================================

    List<Section> findSectionByCid(int cid);

    Section findSectionBySid(int sid);

    //=============================Order=================================

    boolean addSmallOrder(String username,int cid,int sid,String[] members);

    boolean addBigOrder(String username, int cid,String[] members);

    List<Order> findOrderByUsername(String username);

    boolean payOrder(int oid,String username,Double totalMoney);

    boolean returnSmallOrder(String username,int oid);

    boolean returnBigOrder(String username,int oid);

    //=============================Member=================================

    List<Member> findMemberByUsername(String username);


}
