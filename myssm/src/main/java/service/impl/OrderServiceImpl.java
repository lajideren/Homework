package service.impl;

import mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import pobject.Course;
import pobject.Order;
import service.CourseService;
import service.OrderService;

import java.sql.Timestamp;
import java.util.List;

public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private CourseService courseService;

    @Override
    public void addOrder(String username, String cid) {
        Course course=courseService.findCourseById(cid);
        orderMapper.addOrder(username,cid,course.getPrice(),new Timestamp(System.currentTimeMillis()));
    }

    @Override
    public List<Order> showOrders(String username) {
        return orderMapper.showOrders(username);
    }

    @Override
    public boolean findOrder(String username, String cid) {

        return orderMapper.findOrder(username, cid)!=null;

    }
}
