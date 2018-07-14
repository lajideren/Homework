package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pobject.Course;
import service.CourseService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    CourseService courseService;


    @RequestMapping("/")
    public String showIndex(HttpSession session,Model model){



        List<List<Course>> list=new ArrayList<>();

        String city=(String)session.getAttribute("city");

        List<Course> likelist=courseService.findLikeCourseTop5();
//        List<Course> allList1=courseService.findCourseTop10("学前辅导",city);
        List<Course> allList1=courseService.findCourseTop10("学前辅导",city);
        List<Course> allList2=courseService.findCourseTop10("小学辅导",city);
        List<Course> allList3=courseService.findCourseTop10("中学辅导",city);

//        List<Course> allList3=courseService.findCourseTop10("中学辅导",city);

        list.add(likelist);
        list.add(allList1);
        list.add(allList2);
        list.add(allList3);




        model.addAttribute("list",list);

        return "index";

    }




}
