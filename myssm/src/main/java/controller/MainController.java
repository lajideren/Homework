package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pobject.Course;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {


    @RequestMapping("/")
    public String showIndex(HttpSession session,Model model,String city){


        System.out.println("city:"+city);

        List<List<Course>> list=new ArrayList<>();

        List<Course> likelist=new ArrayList<>();
        List<Course> allList1=new ArrayList<>();
        List<Course> allList2=new ArrayList<>();
        List<Course> allList3=new ArrayList<>();

        list.add(likelist);
        list.add(allList1);
        list.add(allList2);
        list.add(allList3);

        Course course=new Course();
        course.setCid("1111");
        for(int i=0;i<10;i++)
        allList1.add(course);

        model.addAttribute("list",list);

        return "index";

    }


}
