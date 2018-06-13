package controller;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import po.*;
import resultmsg.Result_User;
import service.UserService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("changePwd")
    public String changePwd(HttpSession session,Model model, String oldPwd,String newPwd){

        String username=(String)session.getAttribute("username");
        User user=userService.findUserByName(username);
        if(userService.login(username,oldPwd).equals(Result_User.Fail)){
            model.addAttribute("msg","原密码输入不正确");
        }else {
            if(userService.resetPwd(username,newPwd)) {
                model.addAttribute("msg", "修改成功");
            }else {
                model.addAttribute("msg","修改失败");
            }
        }

        return "forward:info";
    }

    @RequestMapping("courses")
    public String courses(HttpSession session,Model model){

        String username=(String)session.getAttribute("username");
        model.addAttribute("user",userService.findUserByName(username));
        List<Course> courses=userService.findAllCourses();
        model.addAttribute("courses",courses);

        return "user/courses";
    }

    @RequestMapping("courseDetail")
    public String courseDetail(HttpSession session,Model model,String cid){

        String username=(String)session.getAttribute("username");
        model.addAttribute("user",userService.findUserByName(username));

        Course course=userService.findCourseByCid(Integer.parseInt(cid));
        model.addAttribute("course",course);

        List<Section> sections=userService.findSectionByCid(Integer.parseInt(cid));
        model.addAttribute("sections",sections);

        return "user/courseDetail";
    }

    @RequestMapping("handleSmallOrder")
    public String handleSmallOrder(HttpSession session,Model model,String[] members,String cid,String sid){

        String username=(String)session.getAttribute("username");
        model.addAttribute("user",userService.findUserByName(username));

        String msg;

        if(userService.addSmallOrder(username,Integer.parseInt(cid),Integer.parseInt(sid),members)){
            msg="预订成功";
        }else {
            msg="预订失败";
        }

        model.addAttribute("msg",msg);
        for(String member:members){
            System.out.println(member);
        }

        //先更新数据，再做查询，保证最新
        Course course=userService.findCourseByCid(Integer.parseInt(cid));
        model.addAttribute("course",course);

        List<Section> sections=userService.findSectionByCid(Integer.parseInt(cid));
        model.addAttribute("sections",sections);

        return "user/courseDetail";
    }

    @RequestMapping("handleBigOrder")
    public String handleBigOrder(HttpSession session,Model model,String[] members,String cid){

        String username=(String)session.getAttribute("username");
        model.addAttribute("user",userService.findUserByName(username));

        String msg;

        if(userService.addBigOrder(username,Integer.parseInt(cid),members)){
            msg="预订成功";
        }else {
            msg="预订失败";
        }

        model.addAttribute("msg",msg);

        //先更新数据，再做查询，保证最新
        Course course=userService.findCourseByCid(Integer.parseInt(cid));
        model.addAttribute("course",course);

        List<Section> sections=userService.findSectionByCid(Integer.parseInt(cid));
        model.addAttribute("sections",sections);

        return "user/courseDetail";
    }

    @RequestMapping("orders")
    public String showOrders(HttpSession session,Model model){

        String username=(String)session.getAttribute("username");
        model.addAttribute("user",userService.findUserByName(username));

        List<Order> orders=userService.findOrderByUsername(username);
        model.addAttribute("orders",orders);


        return "user/orders";
    }

    @RequestMapping("pay")
    public String handlePay(HttpSession session,Model model,String oid,String totalMoney){

        String username=(String)session.getAttribute("username");
        model.addAttribute("user",userService.findUserByName(username));

        String msg;

        if(userService.payOrder(Integer.parseInt(oid),username,Double.parseDouble(totalMoney))){
            msg="支付成功";
        }else {
            msg="支付失败";
        }

        model.addAttribute("msg",msg);

        //先操作再读取
        List<Order> orders=userService.findOrderByUsername(username);
        model.addAttribute("orders",orders);

        return "user/orders";

    }

    @RequestMapping("returnOrder")
    public String handleReturn(HttpSession session,Model model,String oid,String sid){

        String username=(String)session.getAttribute("username");
        model.addAttribute("user",userService.findUserByName(username));


        boolean result;
        if(Integer.parseInt(sid)<=0){
            result=userService.returnBigOrder(username,Integer.parseInt(oid));
        }else {
            result=userService.returnSmallOrder(username,Integer.parseInt(oid));
        }


        String msg;
        if(result){
            msg="退订成功";
        }else {
            msg="退订失败";
        }

        model.addAttribute("msg",msg);

        //先操作再读取
        List<Order> orders=userService.findOrderByUsername(username);
        model.addAttribute("orders",orders);

        return "user/orders";
    }

    @RequestMapping("info")
    public String showInfo(HttpSession session,Model model){

        String username=(String)session.getAttribute("username");
        model.addAttribute("user",userService.findUserByName(username));

        List<Member> members=userService.findMemberByUsername(username);

        List<Course> courses=new ArrayList<>();
        List<Section> sections=new ArrayList<>();

        for(Member member:members){
            courses.add(userService.findCourseByCid(member.getCid()));
            sections.add(userService.findSectionBySid(member.getSid()));
        }

        model.addAttribute("courses",courses);
        model.addAttribute("sections",sections);
        model.addAttribute("members",members);

        return "user/info";
    }

    @RequestMapping("changeCredit")
    public String changeCredit(HttpSession session,Model model,String credit){

        String username=(String)session.getAttribute("username");

        String msg;

        if(userService.changeCredit(username,Double.parseDouble(credit))){
            msg="兑换成功";
        }else {
            msg="兑换失败";
        }

        model.addAttribute("msg",msg);

        return "forward:info";
    }



    @RequestMapping("stopUser")
    public String stopUser(HttpSession session){

        String username=(String)session.getAttribute("username");
        userService.stopUser(username);
        return "redirect:/index.jsp";
    }






}
