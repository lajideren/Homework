package service.impl;

import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.*;
import resultmsg.Result_User;
import service.UserService;
import util.MoneyUtil;


import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;


    @Override
    public Result_User login(String username, String password) {

        User user=userMapper.findUserByName(username);
        if(user==null) {
            return Result_User.Fail;
        }


        if(password.equals(user.getPassword())){
            if(user.isActive()){
                return Result_User.Success;
            }else {
                return Result_User.NotActived;
            }
        }

        return Result_User.Fail;
    }

    @Override
    public boolean signup(User user) {

        user.setCode(UUID.randomUUID().toString().replaceAll("-",""));
        user.setActive(false);
        user.setBalance(0.0);
        user.setTotal_money(0.0);
        user.setCredit(0.0);

        return userMapper.addUser(user) == 1;

    }

    @Override
    public boolean active(String code) {

        return userMapper.activeUser(code)==1;

    }

    @Override
    public User findUserByName(String username) {
        return userMapper.findUserByName(username);
    }

    @Override
    public boolean resetPwd(String username,String newPwd) {

        return userMapper.resetPwd(username, newPwd)==1;

    }

    @Override
    public boolean changeCredit(String username, Double credit) {

        return userMapper.addUserBalance(username,credit/10)==1&&userMapper.addUserCredit(username,-credit)==1;
    }

    @Override
    public void stopUser(String username) {
        userMapper.stopUser(username);
    }

    @Override
    public List<Course> findAllCourses() {

        return userMapper.findAllCourses();

    }

    @Override
    public Course findCourseByCid(int cid) {
        return userMapper.findCourseByCid(cid);
    }

    @Override
    public List<Section> findSectionByCid(int cid) {
        return userMapper.findSectionByCid(cid);
    }

    @Override
    public Section findSectionBySid(int sid) {
        return userMapper.findSectionBySid(sid);
    }


    @Override
    public boolean addSmallOrder(String username, int cid, int sid, String[] members) {
        String str="";
        for(int i=0;i<members.length;i++){
            str+=members[i];
            if(i!=members.length-1){
                str+=";";
            }
        }

        //增加一条订单记录
        Timestamp createTime=new Timestamp(System.currentTimeMillis());
        Order order=new Order();
        order.setUsername(username);
        order.setCid(cid);

        //查找cname
        Course course=userMapper.findCourseByCid(cid);
        String cname=course.getName();
        order.setCname(cname);
        order.setEid(course.getEid());//新增字段，eid

        order.setSid(sid);

        //查找srank
        int srank=userMapper.findSectionBySid(sid).getRank();
        order.setSrank(srank);

        order.setMembers(str);
        order.setPayed(false);
        order.setCanceled(false);
        order.setReturned(false);
        order.setCreateTime(createTime);
        order.setTotalMoney(course.getPrice()*members.length);

        //同时增加班级中的学员信息
        for(int i=0;i<members.length;i++){
            Member member=new Member();
            member.setCid(cid);
            member.setSid(sid);
            member.setUsername(members[i]);
            if(userMapper.addMember(member)!=1){
                return false;
            }
        }

        //修改section的人数
        if(userMapper.addSelected(sid,members.length)!=1){
            return false;
        }

        return userMapper.addOrder(order)==1;


    }

    @Override
    public boolean addBigOrder(String username, int cid,String[] members){

        String str="";
        for(int i=0;i<members.length;i++){
            str+=members[i];
            if(i!=members.length-1){
                str+=";";
            }
        }

        //增加一条订单记录
        Timestamp createTime=new Timestamp(System.currentTimeMillis());
        Order order=new Order();
        order.setUsername(username);
        order.setCid(cid);

        //查找cname
        Course course=userMapper.findCourseByCid(cid);
        String cname=course.getName();
        order.setCname(cname);
        order.setEid(course.getEid());//新增字段，eid

        order.setMembers(str);
        order.setPayed(false);
        order.setCanceled(false);
        order.setReturned(false);
        order.setCreateTime(createTime);
        order.setTotalMoney(course.getPrice()*members.length);


        return userMapper.addOrder(order)==1;

    }

    @Override
    public List<Order> findOrderByUsername(String username) {
        return userMapper.findOrderByUsername(username);
    }

    @Override
    public boolean payOrder(int oid, String username, Double totalMoney) {

        String eid=userMapper.findOrderByOid(oid).getEid();
        userMapper.addInstSales(eid,totalMoney);//增加机构的销售额
        return userMapper.payUser(username,totalMoney)==1&&userMapper.setOrderPayed(oid)==1&&userMapper.setOrderRealMoney(totalMoney,oid)==1;
    }

    @Override
    public boolean returnSmallOrder(String username,int oid) {

        Order order=userMapper.findOrderByOid(oid);
        int cid=order.getCid();
        Course course=userMapper.findCourseByCid(cid);


        //第一步：将order设置为已退订的状态
        userMapper.setOrderReturned(oid);

        //第二步，根据日期计算返回user的钱并返回
        double returnMoney= MoneyUtil.getReturnMoney(order.getRealMoney(),course.getStart_time());
        userMapper.addUserBalance(username,returnMoney);

        //第三步，减少选课人数
        String[] members=order.getMembers().split(";");
        userMapper.addSelected(order.getSid(),-members.length);

        //第四步，将学员从member中移除
        for(String str:members){
            userMapper.delMemberBySid(order.getSid(),str);
        }

        return true;
    }

    @Override
    public boolean returnBigOrder(String username, int oid) {

        Order order=userMapper.findOrderByOid(oid);
        int cid=order.getCid();
        Course course=userMapper.findCourseByCid(cid);

        //第一步：将order设置为已退订的状态
        userMapper.setOrderReturned(oid);

        //第二步，根据日期计算返回user的钱并返回
        double returnMoney= MoneyUtil.getReturnMoney(order.getRealMoney(),course.getStart_time());
        userMapper.addUserBalance(username,returnMoney);

        //第三步
        String[] members=order.getMembers().split(";");
        for(String str:members){
            //先通过cid,username找出member中对应的记录得到所在的班级编号，然后将班级选择人数减一并去除member中的这条记录
            Member member=userMapper.findMember(cid,str);

            if(member==null){//如果查询不到member记录，则此时尚未分配班级
                return true;
            }
            userMapper.delMemberByCid(cid,str);
            userMapper.addSelected(member.getSid(),-1);
        }

        return true;

    }

    @Override
    public List<Member> findMemberByUsername(String username) {
        return userMapper.findMemberByUsername(username);
    }


}
