package mapper;

import org.apache.ibatis.annotations.Param;
import po.Apply;
import po.Institution;
import po.User;

import java.sql.Timestamp;
import java.util.List;

public interface AdminMapper {

    int getRegCount();

    int getModifyCount();

    List<Apply> findAllReg();

    List<Apply> findAllModify();

    Apply findRegByTime(@Param("createTime")Timestamp createTime);

    Apply findModifyByTime(@Param("createTime")Timestamp createTime);

    int approveReg(@Param("createTime")Timestamp createTime,@Param("approved") int approved);

    int approveModify(@Param("createTime")Timestamp createTime,@Param("approved") int approved);

    int updateInst(Apply modify);

    List<User> findAllUsers();

    List<Institution> findAllInsts();


    int emptyInstSales(@Param("eid")String eid);

    int addInstIncome(@Param("eid")String eid,@Param("num")double num);

    int addSysIncome(@Param("num")double num);

    double getSysPayedNum();

    double getSysReturnedNum();

    double getSysIncome();




}
