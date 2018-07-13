package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pobject.Course;
import service.CourseService;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService courseService;


    @RequestMapping("/showInfo")
    public String showInfo(String cid,Model model){

        Course course=courseService.findCourseById(cid);

        model.addAttribute("course",course);

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

}
