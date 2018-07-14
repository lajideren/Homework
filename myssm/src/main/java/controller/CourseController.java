package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pobject.Course;
import service.CourseService;
import service.OrderService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService courseService;
    @Autowired
    private OrderService orderService;


    @RequestMapping("/showInfo")
    public String showInfo(HttpSession session,String cid,Model model){



        Course course=courseService.findCourseById(cid);

        model.addAttribute("course",course);

        String username=(String)session.getAttribute("username");
        if(orderService.findOrder(username,cid)){
            model.addAttribute("selected",true);
        }else {
            model.addAttribute("selected",false);
        }

        return "course";

    }

    @RequestMapping("findByName")
    @ResponseBody
    public List<String> findByName(String cname){

        List<Course> courses=courseService.findCourseByName(cname);

        List<String> strs=new ArrayList<>();
        for(Course course:courses){
            strs.add(course.getCname());
        }

        return strs;

    }


    @RequestMapping("showInfoByName")
    public String showInfoByName(HttpSession session,String cname,Model model){


        Course course=courseService.findCourseByName(cname).get(0);
        model.addAttribute("course",course);

        String cid=course.getCid();
        String username=(String)session.getAttribute("username");
        if(orderService.findOrder(username,cid)){
            model.addAttribute("selected",true);
        }else {
            model.addAttribute("selected",false);
        }

        return "course";

    }


    @RequestMapping("addOrder")
    @ResponseBody
    public void addOrder(HttpSession session, String cid){

        String username=(String)session.getAttribute("username");
        orderService.addOrder(username,cid);

    }
}
