package mapper;

import org.apache.ibatis.annotations.Param;
import pobject.Order;

import java.sql.Timestamp;
import java.util.List;

public interface OrderMapper {

    void addOrder(@Param("username")String username,@Param("cid") String cid,@Param("price") int price,@Param("createTime") Timestamp createTime);

    List<Order> showOrders(@Param("username") String username);

    Order findOrder(@Param("username")String username,@Param("cid")String cid);
}
