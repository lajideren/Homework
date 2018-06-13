package job;

import mapper.UserMapper;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;
import po.Course;
import po.Member;
import po.Order;
import po.Section;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AssignJob extends QuartzJobBean {

    private UserMapper userMapper;

    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {

//        System.out.println("------------------------assign checking------------------------"+new Date(System.currentTimeMillis()));
        userMapper=(UserMapper) jobExecutionContext.getJobDetail().getJobDataMap().get("userMapper");

        List<Order> orders=userMapper.getAllOrders();
        for(int i=0;i<orders.size();i++){

            Order order=orders.get(i);
            Course course=userMapper.findCourseByCid(order.getCid());

            long days=(course.getStart_time().getTime()-System.currentTimeMillis())/(24*60*60*1000l);
            //距离开课时间两周,已支付未退订的订单，sid==0代表尚未分配班级，sid==-1代表已经分配，sid==-2代表分配失败
            if(days<=14 && order.isPayed()&&!order.isReturned()&&order.getSid()==0){
//                if(order.isPayed()&&!order.isReturned()&&order.getSid()==0){

                //找出该课程的所有班级
                List<Section> sections=userMapper.findSectionByCid(order.getCid());
                String[] members=order.getMembers().split(";");


                int spare=0;//空闲人数的累计值
                int count=1;//section数组的计数值,表示在数组的第count位之前能够满足分配班级的要求
                boolean flag=false;//标志位,空闲是否够分配
                for(Section s:sections){

                    spare+=s.getAmount()-s.getSelected();

                    if(spare>=members.length){
                        flag=true;
                        break;
                    }

                    count++;

                }

                int p=0;//members数组的指针
                if(flag){//可以分配

                    //增加选课人数并且分配班级
                    for(int k=0;k<count;k++){

                        Section s=sections.get(k);

                        if(k!=count-1){//当不是需要分配的最后一个班级时

                            int temp=s.getAmount()-s.getSelected();//空闲全部分配
                            //增加选课人数
                            userMapper.addSelected(s.getSid(),temp);
                            //增加班级成员
                            for(int n=0;n<temp;n++){
                                Member member=new Member();
                                member.setCid(s.getCid());
                                member.setSid(s.getSid());
                                member.setUsername(members[p++]);
                                userMapper.addMember(member);
                            }

                        }else {

                            int temp=members.length-p;
                            //增加选课人数
                            userMapper.addSelected(s.getSid(),temp);
                            //增加班级成员
                            for(int n=0;n<temp;n++){
                                Member member=new Member();
                                member.setCid(s.getCid());
                                member.setSid(s.getSid());
                                member.setUsername(members[p++]);
                                userMapper.addMember(member);
                            }
                        }
                    }

                    //最后将订单的sid置为-1，表示分配成功
                    userMapper.setOrderSid(order.getOid(),-1);
                }else {
                    //将订单置为退订
                    userMapper.setOrderReturned(order.getOid());
                    //返还用户余额
                    userMapper.addUserBalance(order.getUsername(),order.getRealMoney());
                    //将sid置为-2，表示分配失败
                    userMapper.setOrderSid(order.getOid(),-2);

                }


            }
        }
    }
}
