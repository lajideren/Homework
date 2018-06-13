package service.impl;

import mapper.InstMapper;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.*;
import resultmsg.Result_Inst;
import service.InstService;
import service.UserService;
import util.LevelUtil;
import util.NumberUtil;

import java.sql.Timestamp;
import java.util.List;

@Service
public class InstServiceImpl implements InstService {

    @Autowired
    private InstMapper instMapper;
    @Autowired
    private UserService userService;
    @Autowired
    private UserMapper userMapper;


    @Override
    synchronized public String genEid() {
        int num=instMapper.getEidCount();
        instMapper.addEidCount();
        return NumberUtil.formatInt7(num);
    }

    @Override
    public boolean addInst(Institution inst) {
        return instMapper.addInst(inst)==1;
    }

    @Override
    public Result_Inst login(String eid, String password) {

        Institution inst=instMapper.findInstByEid(eid);

//        System.out.println(inst);

        if(inst==null){
            return Result_Inst.Fail;
        }
        if(inst.getPassword().equals(password)){
            if(inst.getApproved()==1){
                return Result_Inst.Approved;
            }else if(inst.getApproved()==-1){
                return Result_Inst.NotApproved;
            }else {
                return Result_Inst.Unsolved;
            }
        }

        return Result_Inst.Fail;
    }

    @Override
    public Institution findInstByEid(String eid) {
        return instMapper.findInstByEid(eid);
    }

    @Override
    public boolean addInstModify(Institution inst) {
        return instMapper.addInstModify(inst)==1;
    }

    @Override
    public boolean addCourse(Course course) {
        return instMapper.addCourse(course)==1;
    }

    @Override
    public List<Course> findCourseByEid(String eid) {
        return instMapper.findCourseByEid(eid);
    }

    @Override
    public boolean addSection(Section section) {
        return instMapper.addSection(section)==1;
    }

    @Override
    public int findOrderCount(int pageSize) {
        int count=instMapper.findOrderCount();
        return count%pageSize==0 ? (count/pageSize) : (count/pageSize+1) ;
    }

    @Override
    public List<Order> findOrder(int pageNum, int pageSize) {

        return instMapper.findOrder((pageNum-1)*pageSize,pageSize);

    }

    @Override
    public void addOrder(String[] members, int cid, int sid, String username,String eid) {

        Course course=userService.findCourseByCid(cid);
        Section section=userService.findSectionBySid(sid);
        User user=userService.findUserByName(username);

        //1：增加一条订单记录
        Order order=new Order();
        order.setUsername(username);
        order.setCid(cid);
        order.setCname(course.getName());
        order.setEid(eid);
        order.setSid(sid);
        order.setSrank(section.getRank());
        String str="";
        for(int i=0;i<members.length;i++){
            str+=members[i];
            if(i!=members.length-1){
                str+=";";
            }
        }
        order.setMembers(str);
        order.setCreateTime(new Timestamp(System.currentTimeMillis()));
        order.setTotalMoney(course.getPrice()*members.length);
        if(user==null){
            order.setRealMoney(course.getPrice()*members.length);
        }else {
            order.setRealMoney(course.getPrice() * members.length * (1 - 0.05 * LevelUtil.getLevel(user.getTotal_money())));
        }
        instMapper.addOrder(order);

        //2:增加选课人数
        userMapper.addSelected(sid,members.length);
        //3:插入班级
        for(String temp:members) {
            Member member=new Member();
            member.setCid(cid);
            member.setSid(sid);
            member.setUsername(temp);
            userMapper.addMember(member);
        }



    }

    @Override
    public User findUser(String username) {
        return instMapper.findUser(username);
    }

    @Override
    public List<Member> findMemberBySid(int sid) {
        return instMapper.findMemberBySid(sid);
    }

    @Override
    public void setMemberGrade(int cid, String username, int grade) {
        instMapper.setMemberGrade(cid, username, grade);
    }

    @Override
    public double[] computeStat(String eid) {

        Institution inst=instMapper.findInstByEid(eid);

        double[] num=new double[9];

        num[1]=instMapper.sumOfPayed(eid);
        num[2]=instMapper.sumOfReturned(eid);
        num[0]=num[1]-num[2];

        num[4]=instMapper.sumOfOffline(eid);
        num[5]=inst.getIncome();
        num[3]=num[4]+num[5];

        num[6]=instMapper.getOrder1PayedCount(eid)-instMapper.getOrder1ReturnedCount(eid);
        num[7]=instMapper.getOrder1ReturnedCount(eid);
        num[8]=instMapper.getOrder2Count(eid);


        return num;
    }
}
