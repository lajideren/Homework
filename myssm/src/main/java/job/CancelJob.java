package job;

import mapper.UserMapper;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;
import po.Course;
import po.Member;
import po.Order;
import service.UserService;
import util.MoneyUtil;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class CancelJob extends QuartzJobBean {

    private UserMapper userMapper;


    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {

//        System.out.println("------------------------cancel checking------------------------"+new Date(System.currentTimeMillis()));
        userMapper=(UserMapper) jobExecutionContext.getJobDetail().getJobDataMap().get("userMapper");
//        System.out.println(userMapper==null);
        List<Order> orders=userMapper.getAllOrders();
//        System.out.println(orders.size());
        for(int i=0;i<orders.size();i++){

            Order order=orders.get(i);
            if(!order.isPayed()&&!order.isCanceled()){
//                System.out.println(order);

                Timestamp createTime=order.getCreateTime();
                long minutes=(System.currentTimeMillis() - createTime.getTime() )/(60*1000l);
                System.out.println(minutes+" minutes");

                if(minutes>=15){//超过15分钟自动取消
                    System.out.println("oid:"+order.getOid()+" canceled");
                    if(order.getSid()==0){
                        cancelBigOrder(order.getOid());
                    }else {
                        cancelSmallOrder(order.getOid());
                    }
                }

            }

        }

    }

    private void cancelSmallOrder(int oid){

        Order order=userMapper.findOrderByOid(oid);
        int cid=order.getCid();
        Course course=userMapper.findCourseByCid(cid);


        //第一步：将order设置为已取消的状态
        userMapper.setOrderCanceled(oid);

        //第三步，减少选课人数
        String[] members=order.getMembers().split(";");
        userMapper.addSelected(order.getSid(),-members.length);

        //第四步，将学员从member中移除
        for(String str:members){
            userMapper.delMemberBySid(order.getSid(),str);
        }

    }

    private void cancelBigOrder(int oid){

        Order order=userMapper.findOrderByOid(oid);
        int cid=order.getCid();
        Course course=userMapper.findCourseByCid(cid);

        //第一步：将order设置为已退订的状态
        userMapper.setOrderCanceled(oid);

        //第三步
        String[] members=order.getMembers().split(";");
        for(String str:members){
            //先通过cid,username找出member中对应的记录得到所在的班级编号，然后将班级选择人数减一并去除member中的这条记录
            Member member=userMapper.findMember(cid,str);

            if(member==null){//如果查询不到member记录，则此时尚未分配班级
                return;
            }
            userMapper.delMemberByCid(cid,str);
            userMapper.addSelected(member.getSid(),-1);

        }
    }
}
