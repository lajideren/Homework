package service;

public interface OrderService {

    /**
     * 增加一条订单
     * @param username 用户id
     * @param cid 课程id
     */
    void addOrder(String username,String cid);
}
