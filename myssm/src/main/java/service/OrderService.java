package service;

import pobject.Order;

import java.util.List;

public interface OrderService {

    /**
     * 增加一条订单
     * @param username 用户id
     * @param cid 课程id
     */
    void addOrder(String username,String cid);


    /**
     * 显示用户所有的订单
     * @param username 用户名
     * @return
     */
    List<Order> showOrders(String username);


    /**
     * 查询用户是否已经选择该课程
     * @param username
     * @param cid
     * @return
     */
    boolean findOrder(String username,String cid);

}
