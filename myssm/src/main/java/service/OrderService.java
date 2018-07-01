package service;

public interface OrderService {

    /**
     * 增加一条订单
     * @param uid 用户id
     * @param cid 课程id
     */
    void addOrder(String uid,String cid);
}
