package service.impl;

import mapper.AdminMapper;
import mapper.InstMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.Apply;
import po.Institution;
import po.User;
import service.AdminService;

import java.sql.Timestamp;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private InstMapper instMapper;

    @Override
    public int getRegCount() {
        return adminMapper.getRegCount();
    }

    @Override
    public int getModifyCount() {
        return adminMapper.getModifyCount();
    }

    @Override
    public List<Apply> findAllReg() {
        return adminMapper.findAllReg();
    }

    @Override
    public List<Apply> findAllModify() {
        return adminMapper.findAllModify();
    }

    @Override
    public Apply findRegByTime(Timestamp createTime) {
        return adminMapper.findRegByTime(createTime);
    }

    @Override
    public Apply findModifyByTime(Timestamp createTime) {
        return adminMapper.findModifyByTime(createTime);
    }

    @Override
    public void approveReg(Timestamp createTime, int approved) {
        adminMapper.approveReg(createTime, approved);
    }

    @Override
    public void approveModify(Apply modify, int approved) {
        adminMapper.approveModify(modify.getCreateTime(),approved);
        if(approved==1) {
            adminMapper.updateInst(modify);
        }
    }

    @Override
    public List<User> findAllUsers() {
        return adminMapper.findAllUsers();
    }

    @Override
    public List<Institution> findAllInsts() {
        return adminMapper.findAllInsts();
    }

    @Override
    public void settleInst(String eid, double percent) {
        Institution inst=instMapper.findInstByEid(eid);
        double sales=inst.getSales();
        adminMapper.emptyInstSales(eid);
        adminMapper.addInstIncome(eid,sales*percent*0.01);
        adminMapper.addSysIncome(sales*(1-percent*0.01));

    }

    @Override
    public double[] computeSysStat() {

        double[] num=new double[4];
        num[1]=adminMapper.getSysPayedNum();
        num[2]=adminMapper.getSysReturnedNum();
        num[3]=adminMapper.getSysIncome();
        num[0]=num[1]-num[2];
        return num;

    }
}
