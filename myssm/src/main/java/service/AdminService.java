package service;

import po.Apply;
import po.Institution;
import po.User;

import java.sql.Timestamp;
import java.util.List;

public interface AdminService {

    int getRegCount();

    int getModifyCount();

    List<Apply> findAllReg();

    List<Apply> findAllModify();

    Apply findRegByTime(Timestamp createTime);

    Apply findModifyByTime(Timestamp createTime);

    void approveReg(Timestamp createTime,int approved);

    void approveModify(Apply modify,int approved);

    List<User> findAllUsers();

    List<Institution> findAllInsts();

    void settleInst(String eid,double percent);

    double[] computeSysStat();




}
