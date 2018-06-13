package mapper;

import org.apache.ibatis.annotations.Param;
import po.*;

import java.sql.Timestamp;
import java.util.List;

public interface UserMapper {

    //===============================User=======================================

    User findUserByName(@Param("username")String username);

    int addUser(User user);

    int activeUser(@Param("code")String code);

    int resetPwd(@Param("username")String username,@Param("newPwd")String newPwd);

    int payUser(@Param("username")String username,@Param("delta")Double delta);

    int addUserBalance(@Param("username")String username,@Param("delta")Double delta);

    int addUserCredit(@Param("username")String username,@Param("delta")Double delta);

    int stopUser(@Param("username")String username);

    //===============================Course=======================================

    List<Course> findAllCourses();

    Course findCourseByCid(@Param("cid")int cid);

    //===============================Section=======================================

    List<Section> findSectionByCid(@Param("cid")int cid);

    Section findSectionBySid(@Param("sid")int sid);

    int addSelected(@Param("sid")int sid,@Param("num")int num);

    //===============================Order=======================================

    int addOrder(Order order);

    List<Order> findOrderByUsername(@Param("username")String username);

    int setOrderPayed(@Param("oid")int oid);

    int setOrderRealMoney(@Param("realMoney")double realMoney,@Param("oid")int oid);

    int setOrderReturned(@Param("oid")int oid);

    Order findOrderByOid(@Param("oid")int oid);

    List<Order> getAllOrders();

    int setOrderCanceled(@Param("oid")int oid);

    int setOrderSid(@Param("oid")int oid,@Param("sid")int sid);

    //===============================Member=======================================

    int addMember(Member member);

    int delMemberBySid(@Param("sid")int sid,@Param("username")String username);

    int delMemberByCid(@Param("cid")int cid,@Param("username")String username);

    Member findMember(@Param("cid")int cid,@Param("username")String username);

    List<Member> findMemberByUsername(@Param("username")String username);

    //===============================Inst=========================================

    int addInstSales(@Param("eid")String eid,@Param("num")double num);







}
